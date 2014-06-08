package ProjectIntegrationManagement.PerformIntegratedChangeControl

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ChangeBoardApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ChangeBoardApproval'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [changeBoardApprovalInstanceList: ChangeBoardApproval.list(params), changeBoardApprovalInstanceTotal: ChangeBoardApproval.count()]
    }

    def create() {
        [changeBoardApprovalInstance: new ChangeBoardApproval(params)]
    }

    def save() {
        def changeBoardApprovalInstance = new ChangeBoardApproval(params)
        if (!changeBoardApprovalInstance.save(flush: true)) {
            render(view: "create", model: [changeBoardApprovalInstance: changeBoardApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), changeBoardApprovalInstance.id])
        redirect(action: "show", id: changeBoardApprovalInstance.id)
    }

    def show(Long id) {
        def changeBoardApprovalInstance = ChangeBoardApproval.get(id)
        if (!changeBoardApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), id])
            redirect(action: "list")
            return
        }

        [changeBoardApprovalInstance: changeBoardApprovalInstance]
    }

    def edit(Long id) {
        def changeBoardApprovalInstance = ChangeBoardApproval.get(id)
        if (!changeBoardApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), id])
            redirect(action: "list")
            return
        }

        [changeBoardApprovalInstance: changeBoardApprovalInstance]
    }

    def update(Long id, Long version) {
        def changeBoardApprovalInstance = ChangeBoardApproval.get(id)
        if (!changeBoardApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (changeBoardApprovalInstance.version > version) {
                changeBoardApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval')] as Object[],
                          "Another user has updated this ChangeBoardApproval while you were editing")
                render(view: "edit", model: [changeBoardApprovalInstance: changeBoardApprovalInstance])
                return
            }
        }

        changeBoardApprovalInstance.properties = params

        if (!changeBoardApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [changeBoardApprovalInstance: changeBoardApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), changeBoardApprovalInstance.id])
        redirect(action: "show", id: changeBoardApprovalInstance.id)
    }

    def delete(Long id) {
        def changeBoardApprovalInstance = ChangeBoardApproval.get(id)
        if (!changeBoardApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            changeBoardApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
