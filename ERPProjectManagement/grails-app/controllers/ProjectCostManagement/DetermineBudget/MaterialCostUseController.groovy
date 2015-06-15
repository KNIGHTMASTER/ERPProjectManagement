package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class MaterialCostUseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialCostUseInstanceList: MaterialCostUse.list(params), materialCostUseInstanceTotal: MaterialCostUse.count()]
    }

    def create() {
        [materialCostUseInstance: new MaterialCostUse(params)]
    }

    def save() {
        def materialCostUseInstance = new MaterialCostUse(params)
        if (!materialCostUseInstance.save(flush: true)) {
            render(view: "create", model: [materialCostUseInstance: materialCostUseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), materialCostUseInstance.id])
        redirect(action: "show", id: materialCostUseInstance.id)
    }

    def show(Long id) {
        def materialCostUseInstance = MaterialCostUse.get(id)
        if (!materialCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), id])
            redirect(action: "list")
            return
        }

        [materialCostUseInstance: materialCostUseInstance]
    }

    def edit(Long id) {
        def materialCostUseInstance = MaterialCostUse.get(id)
        if (!materialCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), id])
            redirect(action: "list")
            return
        }

        [materialCostUseInstance: materialCostUseInstance]
    }

    def update(Long id, Long version) {
        def materialCostUseInstance = MaterialCostUse.get(id)
        if (!materialCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialCostUseInstance.version > version) {
                materialCostUseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materialCostUse.label', default: 'MaterialCostUse')] as Object[],
                          "Another user has updated this MaterialCostUse while you were editing")
                render(view: "edit", model: [materialCostUseInstance: materialCostUseInstance])
                return
            }
        }

        materialCostUseInstance.properties = params

        if (!materialCostUseInstance.save(flush: true)) {
            render(view: "edit", model: [materialCostUseInstance: materialCostUseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), materialCostUseInstance.id])
        redirect(action: "show", id: materialCostUseInstance.id)
    }

    def delete(Long id) {
        def materialCostUseInstance = MaterialCostUse.get(id)
        if (!materialCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), id])
            redirect(action: "list")
            return
        }

        try {
            materialCostUseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse'), id])
            redirect(action: "show", id: id)
        }
    }
}
