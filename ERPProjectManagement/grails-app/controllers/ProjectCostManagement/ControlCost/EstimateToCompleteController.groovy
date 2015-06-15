package ProjectCostManagement.ControlCost

import org.springframework.dao.DataIntegrityViolationException

class EstimateToCompleteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [estimateToCompleteInstanceList: EstimateToComplete.list(params), estimateToCompleteInstanceTotal: EstimateToComplete.count()]
    }

    def create() {
        [estimateToCompleteInstance: new EstimateToComplete(params)]
    }

    def save() {
        def estimateToCompleteInstance = new EstimateToComplete(params)
        if (!estimateToCompleteInstance.save(flush: true)) {
            render(view: "create", model: [estimateToCompleteInstance: estimateToCompleteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), estimateToCompleteInstance.id])
        redirect(action: "show", id: estimateToCompleteInstance.id)
    }

    def show(Long id) {
        def estimateToCompleteInstance = EstimateToComplete.get(id)
        if (!estimateToCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), id])
            redirect(action: "list")
            return
        }

        [estimateToCompleteInstance: estimateToCompleteInstance]
    }

    def edit(Long id) {
        def estimateToCompleteInstance = EstimateToComplete.get(id)
        if (!estimateToCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), id])
            redirect(action: "list")
            return
        }

        [estimateToCompleteInstance: estimateToCompleteInstance]
    }

    def update(Long id, Long version) {
        def estimateToCompleteInstance = EstimateToComplete.get(id)
        if (!estimateToCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (estimateToCompleteInstance.version > version) {
                estimateToCompleteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estimateToComplete.label', default: 'EstimateToComplete')] as Object[],
                          "Another user has updated this EstimateToComplete while you were editing")
                render(view: "edit", model: [estimateToCompleteInstance: estimateToCompleteInstance])
                return
            }
        }

        estimateToCompleteInstance.properties = params

        if (!estimateToCompleteInstance.save(flush: true)) {
            render(view: "edit", model: [estimateToCompleteInstance: estimateToCompleteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), estimateToCompleteInstance.id])
        redirect(action: "show", id: estimateToCompleteInstance.id)
    }

    def delete(Long id) {
        def estimateToCompleteInstance = EstimateToComplete.get(id)
        if (!estimateToCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), id])
            redirect(action: "list")
            return
        }

        try {
            estimateToCompleteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estimateToComplete.label', default: 'EstimateToComplete'), id])
            redirect(action: "show", id: id)
        }
    }
}
