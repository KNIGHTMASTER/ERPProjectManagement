package ProjectCommunicationManagement.ManageStakeholderExpectations

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import org.springframework.dao.DataIntegrityViolationException

class ChangeRequestCommunicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
            results = ChangeRequestCommunication.findAllByProjectName(temp)
        }else{
            results = ChangeRequestCommunication.list(params)
        }
        [changeRequestCommunicationInstanceList: results, changeRequestCommunicationInstanceTotal: ChangeRequestCommunication.count()]
    }

    def getProjectName(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            results = ProjectCharter.findByProjectName(temp)
        }else{
            results = ProjectCharter.list(params)
        }
        return results
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
        [changeRequestCommunicationInstance: new ChangeRequestCommunication(params), namaProyek:getProjectName(), changeRequestor:getStakeholder()]
    }

    def save() {
        def changeRequestCommunicationInstance = new ChangeRequestCommunication(params)
        if (!changeRequestCommunicationInstance.save(flush: true)) {
            render(view: "create", model: [changeRequestCommunicationInstance: changeRequestCommunicationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), changeRequestCommunicationInstance.id])
        redirect(action: "show", id: changeRequestCommunicationInstance.id)
    }

    def sendMail(def sender, def username, def email, def message, def project){
        sendMail{
            to email
            from sender
            subject "Change Request for Project $project"
            body message
        }
    }

    def show(Long id) {
        def changeRequestCommunicationInstance = ChangeRequestCommunication.get(id)
        if (!changeRequestCommunicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        def stakeholder
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            stakeholder = StakeholderRegister.findAllByProjectName(sow)
        }else{
            stakeholder = StakeholderRegister.list()
        }
        stakeholder.each{
            if(changeRequestCommunicationInstance.changeRequestor.role == it.role){
            }else{
                sendMail(changeRequestCommunicationInstance.changeRequestor.email, it.fullName, it.email, "Change Requested for :"+changeRequestCommunicationInstance.changeCategory+" because"+changeRequestCommunicationInstance.reasonForChange, changeRequestCommunicationInstance.projectName)
            }
            //End Of SendMail
        }

        [changeRequestCommunicationInstance: changeRequestCommunicationInstance]
    }

    def edit(Long id) {
        def changeRequestCommunicationInstance = ChangeRequestCommunication.get(id)
        if (!changeRequestCommunicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        [changeRequestCommunicationInstance: changeRequestCommunicationInstance, namaProyek:getProjectName(), changeRequestor:getStakeholder()]
    }

    def update(Long id, Long version) {
        def changeRequestCommunicationInstance = ChangeRequestCommunication.get(id)
        if (!changeRequestCommunicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (changeRequestCommunicationInstance.version > version) {
                changeRequestCommunicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication')] as Object[],
                        "Another user has updated this ChangeRequestCommunication while you were editing")
                render(view: "edit", model: [changeRequestCommunicationInstance: changeRequestCommunicationInstance])
                return
            }
        }

        changeRequestCommunicationInstance.properties = params

        if (!changeRequestCommunicationInstance.save(flush: true)) {
            render(view: "edit", model: [changeRequestCommunicationInstance: changeRequestCommunicationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), changeRequestCommunicationInstance.id])
        redirect(action: "show", id: changeRequestCommunicationInstance.id)
    }

    def delete(Long id) {
        def changeRequestCommunicationInstance = ChangeRequestCommunication.get(id)
        if (!changeRequestCommunicationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        try {
            changeRequestCommunicationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "show", id: id)
        }
    }
}
