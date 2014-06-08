package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class CostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [costInstanceList: Cost.list(params), costInstanceTotal: Cost.count()]
    }

    def create() {
        [costInstance: new Cost(params)]
    }

    def save() {
        def costInstance = new Cost(params)
        if (!costInstance.save(flush: true)) {
            render(view: "create", model: [costInstance: costInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cost.label', default: 'Cost'), costInstance.id])
        redirect(action: "show", id: costInstance.id)
    }

    def show(Long id) {
        def costInstance = Cost.get(id)
        if (!costInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cost.label', default: 'Cost'), id])
            redirect(action: "list")
            return
        }

        [costInstance: costInstance]
    }

    def edit(Long id) {
        def costInstance = Cost.get(id)
        if (!costInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cost.label', default: 'Cost'), id])
            redirect(action: "list")
            return
        }

        [costInstance: costInstance]
    }

    def update(Long id, Long version) {
        def costInstance = Cost.get(id)
        if (!costInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cost.label', default: 'Cost'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (costInstance.version > version) {
                costInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cost.label', default: 'Cost')] as Object[],
                          "Another user has updated this Cost while you were editing")
                render(view: "edit", model: [costInstance: costInstance])
                return
            }
        }

        costInstance.properties = params

        if (!costInstance.save(flush: true)) {
            render(view: "edit", model: [costInstance: costInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cost.label', default: 'Cost'), costInstance.id])
        redirect(action: "show", id: costInstance.id)
    }

    def delete(Long id) {
        def costInstance = Cost.get(id)
        if (!costInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cost.label', default: 'Cost'), id])
            redirect(action: "list")
            return
        }

        try {
            costInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cost.label', default: 'Cost'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cost.label', default: 'Cost'), id])
            redirect(action: "show", id: id)
        }
    }
}
