package ProjectProcurementManagement.ConductProcurements

import org.springframework.dao.DataIntegrityViolationException

class MaterialCriteriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialCriteriaInstanceList: MaterialCriteria.list(params), materialCriteriaInstanceTotal: MaterialCriteria.count()]
    }

    def create() {
        [materialCriteriaInstance: new MaterialCriteria(params)]
    }

    def save() {
        def materialCriteriaInstance = new MaterialCriteria(params)
        if (!materialCriteriaInstance.save(flush: true)) {
            render(view: "create", model: [materialCriteriaInstance: materialCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), materialCriteriaInstance.id])
        redirect(action: "show", id: materialCriteriaInstance.id)
    }

    def show(Long id) {
        def materialCriteriaInstance = MaterialCriteria.get(id)
        if (!materialCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), id])
            redirect(action: "list")
            return
        }

        [materialCriteriaInstance: materialCriteriaInstance]
    }

    def edit(Long id) {
        def materialCriteriaInstance = MaterialCriteria.get(id)
        if (!materialCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), id])
            redirect(action: "list")
            return
        }

        [materialCriteriaInstance: materialCriteriaInstance]
    }

    def update(Long id, Long version) {
        def materialCriteriaInstance = MaterialCriteria.get(id)
        if (!materialCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialCriteriaInstance.version > version) {
                materialCriteriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materialCriteria.label', default: 'MaterialCriteria')] as Object[],
                          "Another user has updated this MaterialCriteria while you were editing")
                render(view: "edit", model: [materialCriteriaInstance: materialCriteriaInstance])
                return
            }
        }

        materialCriteriaInstance.properties = params

        if (!materialCriteriaInstance.save(flush: true)) {
            render(view: "edit", model: [materialCriteriaInstance: materialCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), materialCriteriaInstance.id])
        redirect(action: "show", id: materialCriteriaInstance.id)
    }

    def delete(Long id) {
        def materialCriteriaInstance = MaterialCriteria.get(id)
        if (!materialCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), id])
            redirect(action: "list")
            return
        }

        try {
            materialCriteriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materialCriteria.label', default: 'MaterialCriteria'), id])
            redirect(action: "show", id: id)
        }
    }
}
