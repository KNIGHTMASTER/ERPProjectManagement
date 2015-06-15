package ProjectProcurementManagement.PlanProcurement

import org.springframework.dao.DataIntegrityViolationException

class MaterialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialInstanceList: Material.list(params), materialInstanceTotal: Material.count()]
    }

    def create() {
        [materialInstance: new Material(params)]
    }

    def save() {
        def materialInstance = new Material(params)
        if (!materialInstance.save(flush: true)) {
            render(view: "create", model: [materialInstance: materialInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'material.label', default: 'Material'), materialInstance.id])
        redirect(action: "show", id: materialInstance.id)
    }

    def show(Long id) {
        def materialInstance = Material.get(id)
        if (!materialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), id])
            redirect(action: "list")
            return
        }

        [materialInstance: materialInstance]
    }

    def edit(Long id) {
        def materialInstance = Material.get(id)
        if (!materialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), id])
            redirect(action: "list")
            return
        }

        [materialInstance: materialInstance]
    }

    def update(Long id, Long version) {
        def materialInstance = Material.get(id)
        if (!materialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialInstance.version > version) {
                materialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'material.label', default: 'Material')] as Object[],
                          "Another user has updated this Material while you were editing")
                render(view: "edit", model: [materialInstance: materialInstance])
                return
            }
        }

        materialInstance.properties = params

        if (!materialInstance.save(flush: true)) {
            render(view: "edit", model: [materialInstance: materialInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'material.label', default: 'Material'), materialInstance.id])
        redirect(action: "show", id: materialInstance.id)
    }

    def delete(Long id) {
        def materialInstance = Material.get(id)
        if (!materialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), id])
            redirect(action: "list")
            return
        }

        try {
            materialInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'material.label', default: 'Material'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'material.label', default: 'Material'), id])
            redirect(action: "show", id: id)
        }
    }
}
