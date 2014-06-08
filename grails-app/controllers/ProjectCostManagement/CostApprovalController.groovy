package ProjectCostManagement

import org.springframework.dao.DataIntegrityViolationException

class CostApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [costApprovalInstanceList: CostApproval.list(params), costApprovalInstanceTotal: CostApproval.count()]
    }

    def create() {
        [costApprovalInstance: new CostApproval(params)]
    }

    def save() {
        def costApprovalInstance = new CostApproval(params)
        if (!costApprovalInstance.save(flush: true)) {
            render(view: "create", model: [costApprovalInstance: costApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), costApprovalInstance.id])
        redirect(action: "show", id: costApprovalInstance.id)
    }

    def show(Long id) {
        def costApprovalInstance = CostApproval.get(id)
        if (!costApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), id])
            redirect(action: "list")
            return
        }

        [costApprovalInstance: costApprovalInstance]
    }

    def edit(Long id) {
        def costApprovalInstance = CostApproval.get(id)
        if (!costApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), id])
            redirect(action: "list")
            return
        }

        [costApprovalInstance: costApprovalInstance]
    }

    def update(Long id, Long version) {
        def costApprovalInstance = CostApproval.get(id)
        if (!costApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (costApprovalInstance.version > version) {
                costApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'costApproval.label', default: 'CostApproval')] as Object[],
                          "Another user has updated this CostApproval while you were editing")
                render(view: "edit", model: [costApprovalInstance: costApprovalInstance])
                return
            }
        }

        costApprovalInstance.properties = params

        if (!costApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [costApprovalInstance: costApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), costApprovalInstance.id])
        redirect(action: "show", id: costApprovalInstance.id)
    }

    def delete(Long id) {
        def costApprovalInstance = CostApproval.get(id)
        if (!costApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            costApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'costApproval.label', default: 'CostApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
