package ProjectProcurementManagement.PlanProcurement

import org.springframework.dao.DataIntegrityViolationException

class ApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [approvalInstanceList: Approval.list(params), approvalInstanceTotal: Approval.count()]
    }

    def create() {
        [approvalInstance: new Approval(params)]
    }

    def save() {
        def approvalInstance = new Approval(params)
        if (!approvalInstance.save(flush: true)) {
            render(view: "create", model: [approvalInstance: approvalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'approval.label', default: 'Approval'), approvalInstance.id])
        redirect(action: "show", id: approvalInstance.id)
    }

    def show(Long id) {
        def approvalInstance = Approval.get(id)
        if (!approvalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'approval.label', default: 'Approval'), id])
            redirect(action: "list")
            return
        }

        [approvalInstance: approvalInstance]
    }

    def edit(Long id) {
        def approvalInstance = Approval.get(id)
        if (!approvalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'approval.label', default: 'Approval'), id])
            redirect(action: "list")
            return
        }

        [approvalInstance: approvalInstance]
    }

    def update(Long id, Long version) {
        def approvalInstance = Approval.get(id)
        if (!approvalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'approval.label', default: 'Approval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (approvalInstance.version > version) {
                approvalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'approval.label', default: 'Approval')] as Object[],
                          "Another user has updated this Approval while you were editing")
                render(view: "edit", model: [approvalInstance: approvalInstance])
                return
            }
        }

        approvalInstance.properties = params

        if (!approvalInstance.save(flush: true)) {
            render(view: "edit", model: [approvalInstance: approvalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'approval.label', default: 'Approval'), approvalInstance.id])
        redirect(action: "show", id: approvalInstance.id)
    }

    def delete(Long id) {
        def approvalInstance = Approval.get(id)
        if (!approvalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'approval.label', default: 'Approval'), id])
            redirect(action: "list")
            return
        }

        try {
            approvalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'approval.label', default: 'Approval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'approval.label', default: 'Approval'), id])
            redirect(action: "show", id: id)
        }
    }
}
