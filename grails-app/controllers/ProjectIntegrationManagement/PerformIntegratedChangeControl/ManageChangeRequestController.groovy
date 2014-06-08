package ProjectIntegrationManagement.PerformIntegratedChangeControl


import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ManageChangeRequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ManageChangeRequest'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [manageChangeRequestInstanceList: ManageChangeRequest.list(params), manageChangeRequestInstanceTotal: ManageChangeRequest.count()]
    }

    def create() {
        [manageChangeRequestInstance: new ManageChangeRequest(params)]
    }

    def sendMail(def sender, def username, def email, def message, def project, def category){
        sendMail{
            to email
            from sender
            subject "Change Request Status for ${category}"
            body message
        }
    }

    def save() {
        def manageChangeRequestInstance = new ManageChangeRequest(params)
        if (!manageChangeRequestInstance.save(flush: true)) {
            render(view: "create", model: [manageChangeRequestInstance: manageChangeRequestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), manageChangeRequestInstance.id])
        redirect(action: "show", id: manageChangeRequestInstance.id)
    }

    def show(Long id) {
        def manageChangeRequestInstance = ManageChangeRequest.get(id)
        if (!manageChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), id])
            redirect(action: "list")
            return
        }

        if(manageChangeRequestInstance.approval == Boolean.TRUE){
            //Start SendMail
            def data = StakeholderRegister.list()
            data.each{
                def message = "Change Request Status for "+manageChangeRequestInstance.changeRequests+manageChangeRequestInstance.varianceAnalysis+" is"+manageChangeRequestInstance.approval+" because "+manageChangeRequestInstance.comments
                if(manageChangeRequestInstance.changeRequests==null && manageChangeRequestInstance.varianceAnalysis){
                    sendMail(manageChangeRequestInstance.peopleWhoApprove.stakeholder.email, it.fullName, it.email, message,it.projectName, manageChangeRequestInstance.varianceAnalysis.changeCategory)
                }else if(manageChangeRequestInstance.changeRequests && manageChangeRequestInstance.varianceAnalysis==null){
                    sendMail(manageChangeRequestInstance.peopleWhoApprove.stakeholder.email, it.fullName, it.email, message,it.projectName, manageChangeRequestInstance.changeRequests.changeCategory)
                }
            }
            //End of SendMail
        }

        [manageChangeRequestInstance: manageChangeRequestInstance]
    }

    def edit(Long id) {
        def manageChangeRequestInstance = ManageChangeRequest.get(id)
        if (!manageChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), id])
            redirect(action: "list")
            return
        }

        [manageChangeRequestInstance: manageChangeRequestInstance]
    }

    def update(Long id, Long version) {
        def manageChangeRequestInstance = ManageChangeRequest.get(id)
        if (!manageChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (manageChangeRequestInstance.version > version) {
                manageChangeRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest')] as Object[],
                          "Another user has updated this ManageChangeRequest while you were editing")
                render(view: "edit", model: [manageChangeRequestInstance: manageChangeRequestInstance])
                return
            }
        }

        manageChangeRequestInstance.properties = params

        if (!manageChangeRequestInstance.save(flush: true)) {
            render(view: "edit", model: [manageChangeRequestInstance: manageChangeRequestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), manageChangeRequestInstance.id])
        redirect(action: "show", id: manageChangeRequestInstance.id)
    }

    def delete(Long id) {
        def manageChangeRequestInstance = ManageChangeRequest.get(id)
        if (!manageChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), id])
            redirect(action: "list")
            return
        }

        try {
            manageChangeRequestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest'), id])
            redirect(action: "show", id: id)
        }
    }
}
