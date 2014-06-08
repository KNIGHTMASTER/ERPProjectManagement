package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class MaterialCostActivityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialCostActivityInstanceList: MaterialCostActivity.list(params), materialCostActivityInstanceTotal: MaterialCostActivity.count()]
    }

    def create() {
        [materialCostActivityInstance: new MaterialCostActivity(params)]
    }

    def save() {
        def materialCostActivityInstance = new MaterialCostActivity(params)
        if (!materialCostActivityInstance.save(flush: true)) {
            render(view: "create", model: [materialCostActivityInstance: materialCostActivityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), materialCostActivityInstance.id])
        redirect(action: "show", id: materialCostActivityInstance.id)
    }

    def show(Long id) {
        def materialCostActivityInstance = MaterialCostActivity.get(id)
        if (!materialCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), id])
            redirect(action: "list")
            return
        }

        [materialCostActivityInstance: materialCostActivityInstance]
    }

    def edit(Long id) {
        def materialCostActivityInstance = MaterialCostActivity.get(id)
        if (!materialCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), id])
            redirect(action: "list")
            return
        }

        [materialCostActivityInstance: materialCostActivityInstance]
    }

    def update(Long id, Long version) {
        def materialCostActivityInstance = MaterialCostActivity.get(id)
        if (!materialCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialCostActivityInstance.version > version) {
                materialCostActivityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity')] as Object[],
                          "Another user has updated this MaterialCostActivity while you were editing")
                render(view: "edit", model: [materialCostActivityInstance: materialCostActivityInstance])
                return
            }
        }

        materialCostActivityInstance.properties = params

        if (!materialCostActivityInstance.save(flush: true)) {
            render(view: "edit", model: [materialCostActivityInstance: materialCostActivityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), materialCostActivityInstance.id])
        redirect(action: "show", id: materialCostActivityInstance.id)
    }

    def delete(Long id) {
        def materialCostActivityInstance = MaterialCostActivity.get(id)
        if (!materialCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), id])
            redirect(action: "list")
            return
        }

        try {
            materialCostActivityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity'), id])
            redirect(action: "show", id: id)
        }
    }
}
