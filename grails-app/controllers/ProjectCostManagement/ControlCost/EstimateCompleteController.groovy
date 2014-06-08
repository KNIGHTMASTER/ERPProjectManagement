package ProjectCostManagement.ControlCost

import org.springframework.dao.DataIntegrityViolationException

class EstimateCompleteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [estimateCompleteInstanceList: EstimateComplete.list(params), estimateCompleteInstanceTotal: EstimateComplete.count()]
    }

    def create() {
        [estimateCompleteInstance: new EstimateComplete(params)]
    }

    def save() {
        def estimateCompleteInstance = new EstimateComplete(params)
        if (!estimateCompleteInstance.save(flush: true)) {
            render(view: "create", model: [estimateCompleteInstance: estimateCompleteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), estimateCompleteInstance.id])
        redirect(action: "show", id: estimateCompleteInstance.id)
    }

    def show(Long id) {
        def estimateCompleteInstance = EstimateComplete.get(id)
        if (!estimateCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), id])
            redirect(action: "list")
            return
        }

        [estimateCompleteInstance: estimateCompleteInstance]
    }

    def edit(Long id) {
        def estimateCompleteInstance = EstimateComplete.get(id)
        if (!estimateCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), id])
            redirect(action: "list")
            return
        }

        [estimateCompleteInstance: estimateCompleteInstance]
    }

    def update(Long id, Long version) {
        def estimateCompleteInstance = EstimateComplete.get(id)
        if (!estimateCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (estimateCompleteInstance.version > version) {
                estimateCompleteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estimateComplete.label', default: 'EstimateComplete')] as Object[],
                          "Another user has updated this EstimateComplete while you were editing")
                render(view: "edit", model: [estimateCompleteInstance: estimateCompleteInstance])
                return
            }
        }

        estimateCompleteInstance.properties = params

        if (!estimateCompleteInstance.save(flush: true)) {
            render(view: "edit", model: [estimateCompleteInstance: estimateCompleteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), estimateCompleteInstance.id])
        redirect(action: "show", id: estimateCompleteInstance.id)
    }

    def delete(Long id) {
        def estimateCompleteInstance = EstimateComplete.get(id)
        if (!estimateCompleteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), id])
            redirect(action: "list")
            return
        }

        try {
            estimateCompleteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estimateComplete.label', default: 'EstimateComplete'), id])
            redirect(action: "show", id: id)
        }
    }
}
