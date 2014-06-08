package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class HumanResourceCostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [humanResourceCostInstanceList: HumanResourceCost.list(params), humanResourceCostInstanceTotal: HumanResourceCost.count()]
    }

    def create() {
        [humanResourceCostInstance: new HumanResourceCost(params)]
    }

    def save() {
        def humanResourceCostInstance = new HumanResourceCost(params)
        if (!humanResourceCostInstance.save(flush: true)) {
            render(view: "create", model: [humanResourceCostInstance: humanResourceCostInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), humanResourceCostInstance.id])
        redirect(action: "show", id: humanResourceCostInstance.id)
    }

    def show(Long id) {
        def humanResourceCostInstance = HumanResourceCost.get(id)
        if (!humanResourceCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), id])
            redirect(action: "list")
            return
        }

        [humanResourceCostInstance: humanResourceCostInstance]
    }

    def edit(Long id) {
        def humanResourceCostInstance = HumanResourceCost.get(id)
        if (!humanResourceCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), id])
            redirect(action: "list")
            return
        }

        [humanResourceCostInstance: humanResourceCostInstance]
    }

    def update(Long id, Long version) {
        def humanResourceCostInstance = HumanResourceCost.get(id)
        if (!humanResourceCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (humanResourceCostInstance.version > version) {
                humanResourceCostInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'humanResourceCost.label', default: 'HumanResourceCost')] as Object[],
                          "Another user has updated this HumanResourceCost while you were editing")
                render(view: "edit", model: [humanResourceCostInstance: humanResourceCostInstance])
                return
            }
        }

        humanResourceCostInstance.properties = params

        if (!humanResourceCostInstance.save(flush: true)) {
            render(view: "edit", model: [humanResourceCostInstance: humanResourceCostInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), humanResourceCostInstance.id])
        redirect(action: "show", id: humanResourceCostInstance.id)
    }

    def delete(Long id) {
        def humanResourceCostInstance = HumanResourceCost.get(id)
        if (!humanResourceCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), id])
            redirect(action: "list")
            return
        }

        try {
            humanResourceCostInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost'), id])
            redirect(action: "show", id: id)
        }
    }
}
