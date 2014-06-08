package ProjectProcurementManagement.AdministerProcurements

import org.springframework.dao.DataIntegrityViolationException

class MaterialResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialResourceInstanceList: MaterialResource.list(params), materialResourceInstanceTotal: MaterialResource.count()]
    }

    def create() {
        [materialResourceInstance: new MaterialResource(params)]
    }

    def save() {
        def materialResourceInstance = new MaterialResource(params)
        if (!materialResourceInstance.save(flush: true)) {
            render(view: "create", model: [materialResourceInstance: materialResourceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), materialResourceInstance.id])
        redirect(action: "show", id: materialResourceInstance.id)
    }

    def show(Long id) {
        def materialResourceInstance = MaterialResource.get(id)
        if (!materialResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), id])
            redirect(action: "list")
            return
        }

        [materialResourceInstance: materialResourceInstance]
    }

    def edit(Long id) {
        def materialResourceInstance = MaterialResource.get(id)
        if (!materialResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), id])
            redirect(action: "list")
            return
        }

        [materialResourceInstance: materialResourceInstance]
    }

    def update(Long id, Long version) {
        def materialResourceInstance = MaterialResource.get(id)
        if (!materialResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialResourceInstance.version > version) {
                materialResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materialResource.label', default: 'MaterialResource')] as Object[],
                          "Another user has updated this MaterialResource while you were editing")
                render(view: "edit", model: [materialResourceInstance: materialResourceInstance])
                return
            }
        }

        materialResourceInstance.properties = params

        if (!materialResourceInstance.save(flush: true)) {
            render(view: "edit", model: [materialResourceInstance: materialResourceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), materialResourceInstance.id])
        redirect(action: "show", id: materialResourceInstance.id)
    }

    def delete(Long id) {
        def materialResourceInstance = MaterialResource.get(id)
        if (!materialResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), id])
            redirect(action: "list")
            return
        }

        try {
            materialResourceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materialResource.label', default: 'MaterialResource'), id])
            redirect(action: "show", id: id)
        }
    }
}
