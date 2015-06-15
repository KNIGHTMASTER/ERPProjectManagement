package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class CostBaselineController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [costBaselineInstanceList: CostBaseline.list(params), costBaselineInstanceTotal: CostBaseline.count()]
    }

    def create() {
        [costBaselineInstance: new CostBaseline(params)]
    }

    def save() {
        def costBaselineInstance = new CostBaseline(params)
        if (!costBaselineInstance.save(flush: true)) {
            render(view: "create", model: [costBaselineInstance: costBaselineInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), costBaselineInstance.id])
        redirect(action: "show", id: costBaselineInstance.id)
    }

    def show(Long id) {
        def costBaselineInstance = CostBaseline.get(id)
        if (!costBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), id])
            redirect(action: "list")
            return
        }

        [costBaselineInstance: costBaselineInstance]
    }

    def edit(Long id) {
        def costBaselineInstance = CostBaseline.get(id)
        if (!costBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), id])
            redirect(action: "list")
            return
        }

        [costBaselineInstance: costBaselineInstance]
    }

    def update(Long id, Long version) {
        def costBaselineInstance = CostBaseline.get(id)
        if (!costBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (costBaselineInstance.version > version) {
                costBaselineInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'costBaseline.label', default: 'CostBaseline')] as Object[],
                          "Another user has updated this CostBaseline while you were editing")
                render(view: "edit", model: [costBaselineInstance: costBaselineInstance])
                return
            }
        }

        costBaselineInstance.properties = params

        if (!costBaselineInstance.save(flush: true)) {
            render(view: "edit", model: [costBaselineInstance: costBaselineInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), costBaselineInstance.id])
        redirect(action: "show", id: costBaselineInstance.id)
    }

    def delete(Long id) {
        def costBaselineInstance = CostBaseline.get(id)
        if (!costBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), id])
            redirect(action: "list")
            return
        }

        try {
            costBaselineInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'costBaseline.label', default: 'CostBaseline'), id])
            redirect(action: "show", id: id)
        }
    }
}
