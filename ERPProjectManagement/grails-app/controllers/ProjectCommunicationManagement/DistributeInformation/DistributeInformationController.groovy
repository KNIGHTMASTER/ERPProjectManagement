package ProjectCommunicationManagement.DistributeInformation

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectTimeManagement.DefineActivity.Activity
import ProjectTimeManagement.DefineActivity.ActivityTracking
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class DistributeInformationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PCOM'])
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            results = DistributeInformation.findAllByProjectCharter(temp)
        }else{
            results = DistributeInformation.list(params)
        }
        [distributeInformationInstanceList: results, distributeInformationInstanceTotal: DistributeInformation.count()]
    }

    def getNamaProyek(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            results = ProjectCharter.findByProjectName(temp)
        }else{
            results = ProjectCharter.list()
        }
        return results
    }

    def getActivityTracking(){
        def result = []
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            milestones.each {
                activities = Activity.executeQuery("select t from Activity t where t.id = ${it.id}")
                activities.each{
                    result.addAll(it.trackings)
                }
            }
        }else{
            result = ActivityTracking.list(params)
        }
        return result
    }

    def getStakeholder(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            results = StakeholderRegister.findAllByProjectName(temp)
        }else{
            results = StakeholderRegister.list(params)
        }
        return results
    }

    def create() {
        [distributeInformationInstance: new DistributeInformation(params), namaProyek:getNamaProyek(), activityTracking:getActivityTracking(), stakeholder:getStakeholder()]
    }

    def save() {
        def distributeInformationInstance = new DistributeInformation(params)
        if (!distributeInformationInstance.save(flush: true)) {
            render(view: "create", model: [distributeInformationInstance: distributeInformationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), distributeInformationInstance.id])
        redirect(action: "show", id: distributeInformationInstance.id)
    }

    def sendMail(def username, def email, def message, def project){
        sendMail{
            to email
            from "astrie@erpprojectmanagement.com"
            subject "Project Status for Project $project"
            body message
        }
    }

    def show(Long id) {
        def distributeInformationInstance = DistributeInformation.get(id)
        if (!distributeInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), id])
            redirect(action: "list")
            return
        }

        //send email
            def stakeholder = distributeInformationInstance.stakeholder
            def activityTrackings = distributeInformationInstance.activityTracking
            def messageActivity = "Activity = "+activityTrackings.activity+"\n"+"Work = "+activityTrackings.doWork+"\n"+"Complete = "+activityTrackings.complete+"\nHours = "+activityTrackings.hours+"\n"+" Note = "+activityTrackings.note
            def message = "Project = "+distributeInformationInstance.projectCharter+"\n"+messageActivity+"\n"+"Summary = "+distributeInformationInstance.summary+"\n Work Planned Last Activity = "+distributeInformationInstance.workPlannedLastActivity+"\n Work Planned Next Activity"+distributeInformationInstance.workPlannedNextActivity+"\n Open Issues = "+distributeInformationInstance.openIssues+"\n Open Risks = "+distributeInformationInstance.openRisks

            stakeholder.each{
                sendMail(it.fullName, it.email, message, distributeInformationInstance.projectCharter)
            }

        [distributeInformationInstance: distributeInformationInstance]
    }

    def edit(Long id) {
        def distributeInformationInstance = DistributeInformation.get(id)
        if (!distributeInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), id])
            redirect(action: "list")
            return
        }

        [distributeInformationInstance: distributeInformationInstance, namaProyek:getNamaProyek(), activityTracking:getActivityTracking(), stakeholder:getStakeholder()]
    }

    def update(Long id, Long version) {
        def distributeInformationInstance = DistributeInformation.get(id)
        if (!distributeInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (distributeInformationInstance.version > version) {
                distributeInformationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'distributeInformation.label', default: 'DistributeInformation')] as Object[],
                          "Another user has updated this DistributeInformation while you were editing")
                render(view: "edit", model: [distributeInformationInstance: distributeInformationInstance])
                return
            }
        }

        distributeInformationInstance.properties = params

        if (!distributeInformationInstance.save(flush: true)) {
            render(view: "edit", model: [distributeInformationInstance: distributeInformationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), distributeInformationInstance.id])
        redirect(action: "show", id: distributeInformationInstance.id)
    }

    def delete(Long id) {
        def distributeInformationInstance = DistributeInformation.get(id)
        if (!distributeInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), id])
            redirect(action: "list")
            return
        }

        try {
            distributeInformationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'distributeInformation.label', default: 'DistributeInformation'), id])
            redirect(action: "show", id: id)
        }
    }
}
