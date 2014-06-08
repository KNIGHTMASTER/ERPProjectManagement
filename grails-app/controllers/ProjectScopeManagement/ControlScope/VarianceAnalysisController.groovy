package ProjectScopeManagement.ControlScope

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectIntegrationManagement.PerformIntegratedChangeControl.ManageChangeRequest
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class VarianceAnalysisController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=VarianceAnalysis'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            result = VarianceAnalysis.findByProjectName(charter)
        }else{
            result = VarianceAnalysis.list(params)
        }
        [varianceAnalysisInstanceList: result, varianceAnalysisInstanceTotal: VarianceAnalysis.count()]
    }

    def getProjectName(){
        def charter
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            charter = ProjectCharter.findByProjectName(proposal)
        }else{
            charter = ProjectCharter.list()
        }
        return charter
    }

    def getStakeholder(){
        def stakeholder
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            stakeholder = StakeholderRegister.findAllByProjectName(sow)
        }else{
            stakeholder = StakeholderRegister.findAllByProjectName(sow)
        }
        return stakeholder
    }

    def create() {
        if(session.proyek){
            [varianceAnalysisInstance: new VarianceAnalysis(params), namaProyek:getProjectName(), stakeholder: getStakeholder()]
        }else{
            [varianceAnalysisInstance: new VarianceAnalysis(params)]
        }
    }

    def save() {
        def varianceAnalysisInstance = new VarianceAnalysis(params)
        if (!varianceAnalysisInstance.save(flush: true)) {
            render(view: "create", model: [varianceAnalysisInstance: varianceAnalysisInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), varianceAnalysisInstance.id])
        redirect(action: "show", id: varianceAnalysisInstance.id)
    }


    def sendMail(def sender, def username, def email, def message, def project){
        sendMail{
            to email
            from sender
            subject "Variance Analysis for $project"
            body message
        }
    }

    def show(Long id) {
        def varianceAnalysisInstance = VarianceAnalysis.get(id)
        if (!varianceAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), id])
            redirect(action: "list")
            return
        }

        def manageChangeRequest = new ManageChangeRequest()
            //Insert Automatic to Manage Change Request
            manageChangeRequest.projectName = varianceAnalysisInstance.projectName
            manageChangeRequest.dateRequested = varianceAnalysisInstance.dateRequested
            manageChangeRequest.dateApproved = new Date()
            manageChangeRequest.peopleWhoApprove = null
            manageChangeRequest.varianceAnalysis = varianceAnalysisInstance.list()
            manageChangeRequest.approval = Boolean.FALSE
            manageChangeRequest.comments = ""
            manageChangeRequest.recommendedAction = ""
            manageChangeRequest.save()
            //End of Auto insert

            //Start SendMail
        def stakeholder
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            stakeholder = StakeholderRegister.findAllByProjectName(sow)
        }else{
            stakeholder = StakeholderRegister.list()
        }
            stakeholder.each{
                if(varianceAnalysisInstance.changeRequestor.role == it.role){

                }else{
                    sendMail(varianceAnalysisInstance.changeRequestor.email, it.fullName, it.email, "Variance Analysis Requested for :"+varianceAnalysisInstance.changeCategory+" because"+varianceAnalysisInstance.reasonForChange, varianceAnalysisInstance.projectName)
                }
                //End Of SendMail
            }

        [varianceAnalysisInstance: varianceAnalysisInstance]
    }

    def edit(Long id) {
        def varianceAnalysisInstance = VarianceAnalysis.get(id)
        if (!varianceAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), id])
            redirect(action: "list")
            return
        }

        if(session.proyek){
            [varianceAnalysisInstance: varianceAnalysisInstance, namaProyek: getProjectName(), stakeholder: getStakeholder()]
        }else{
            [varianceAnalysisInstance: varianceAnalysisInstance]
        }

    }

    def update(Long id, Long version) {
        def varianceAnalysisInstance = VarianceAnalysis.get(id)
        if (!varianceAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (varianceAnalysisInstance.version > version) {
                varianceAnalysisInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis')] as Object[],
                          "Another user has updated this VarianceAnalysis while you were editing")
                render(view: "edit", model: [varianceAnalysisInstance: varianceAnalysisInstance])
                return
            }
        }

        varianceAnalysisInstance.properties = params

        if (!varianceAnalysisInstance.save(flush: true)) {
            render(view: "edit", model: [varianceAnalysisInstance: varianceAnalysisInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), varianceAnalysisInstance.id])
        redirect(action: "show", id: varianceAnalysisInstance.id)
    }

    def delete(Long id) {
        def varianceAnalysisInstance = VarianceAnalysis.get(id)
        if (!varianceAnalysisInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), id])
            redirect(action: "list")
            return
        }

        try {
            varianceAnalysisInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis'), id])
            redirect(action: "show", id: id)
        }
    }
}
