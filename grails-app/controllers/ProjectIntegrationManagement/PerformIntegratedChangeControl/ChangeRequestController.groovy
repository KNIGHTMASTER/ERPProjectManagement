package ProjectIntegrationManagement.PerformIntegratedChangeControl


import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ChangeRequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ChangeRequestCommunication'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            result = ChangeRequest.findAllByProjectName(charter)
        }else{
            result = ChangeRequest.list(params)
        }
        [changeRequestInstanceList: result, changeRequestInstanceTotal: result.size()]
    }

    def getProjectName(){
        def charter
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            charter = ProjectCharter.findByProjectName(proposal)
        }else{
            charter = ProjectCharter.findAllByProjectName()
        }
        return charter
    }

    def getStakeholder(){
        def stakeholder
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            stakeholder= StakeholderRegister.findAllByProjectName(sow)
        }else{
            stakeholder = StakeholderRegister.findAllByProjectName()
        }
        return stakeholder
    }

    def create() {
        if(session.proyek){
            [changeRequestInstance: new ChangeRequest(params), namaProyek:getProjectName(), stakeholder:getStakeholder()]
        }else{
            [changeRequestInstance: new ChangeRequest(params)]
        }
    }

    def save() {
        def changeRequestInstance = new ChangeRequest(params)
        if (!changeRequestInstance.save(flush: true)) {
            render(view: "create", model: [changeRequestInstance: changeRequestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), changeRequestInstance.id])
        redirect(action: "show", id: changeRequestInstance.id)
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
        def changeRequestInstance = ChangeRequest.get(id)
        if (!changeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        def manageChangeRequest = new ManageChangeRequest()
        /*def data = ManageChangeRequest.findByChangeRequest(changeRequestInstance)
        if(data){

        }else{*/
            //Insert Automatic to Manage Change Request
            manageChangeRequest.projectName = changeRequestInstance.projectName
            manageChangeRequest.dateRequested = changeRequestInstance.dateRequested
            manageChangeRequest.dateApproved = new Date()
            manageChangeRequest.peopleWhoApprove = null
            manageChangeRequest.changeRequests = changeRequestInstance.list()
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
            if(changeRequestInstance.changeRequestor.role == it.role){
                }else{
                    sendMail(changeRequestInstance.changeRequestor.email, it.fullName, it.email, "Change Requested for :"+changeRequestInstance.changeCategory+" because"+changeRequestInstance.reasonForChange, changeRequestInstance.projectName)
                }
                //End Of SendMail
            }
        //}

        [changeRequestInstance: changeRequestInstance]
    }

    def edit(Long id) {
        def changeRequestInstance = ChangeRequest.get(id)
        if (!changeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        if(session.proyek){
            [changeRequestInstance: changeRequestInstance, namaProyek:getProjectName(), stakeholder: getStakeholder()]
        }else{
            [changeRequestInstance: changeRequestInstance]
        }
    }

    def update(Long id, Long version) {
        def changeRequestInstance = ChangeRequest.get(id)
        if (!changeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (changeRequestInstance.version > version) {
                changeRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication')] as Object[],
                          "Another user has updated this ChangeRequestCommunication while you were editing")
                render(view: "edit", model: [changeRequestInstance: changeRequestInstance])
                return
            }
        }

        changeRequestInstance.properties = params

        if (!changeRequestInstance.save(flush: true)) {
            render(view: "edit", model: [changeRequestInstance: changeRequestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), changeRequestInstance.id])
        redirect(action: "show", id: changeRequestInstance.id)
    }

    def delete(Long id) {
        def changeRequestInstance = ChangeRequest.get(id)
        if (!changeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
            return
        }

        try {
            changeRequestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeRequest.label', default: 'ChangeRequestCommunication'), id])
            redirect(action: "show", id: id)
        }
    }
}
