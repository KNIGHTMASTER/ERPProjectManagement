package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationMaterialCostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationMaterialCostInstanceList: IdentificationMaterialCost.list(params), identificationMaterialCostInstanceTotal: IdentificationMaterialCost.count()]
    }

    def create() {
        [identificationMaterialCostInstance: new IdentificationMaterialCost(params)]
    }

    def save() {
        def identificationMaterialCostInstance = new IdentificationMaterialCost(params)
        if (!identificationMaterialCostInstance.save(flush: true)) {
            render(view: "create", model: [identificationMaterialCostInstance: identificationMaterialCostInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), identificationMaterialCostInstance.id])
        redirect(action: "show", id: identificationMaterialCostInstance.id)
    }

    def show(Long id) {
        def identificationMaterialCostInstance = IdentificationMaterialCost.get(id)
        if (!identificationMaterialCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), id])
            redirect(action: "list")
            return
        }

        [identificationMaterialCostInstance: identificationMaterialCostInstance]
    }

    def edit(Long id) {
        def identificationMaterialCostInstance = IdentificationMaterialCost.get(id)
        if (!identificationMaterialCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), id])
            redirect(action: "list")
            return
        }

        [identificationMaterialCostInstance: identificationMaterialCostInstance]
    }

    def update(Long id, Long version) {
        def identificationMaterialCostInstance = IdentificationMaterialCost.get(id)
        if (!identificationMaterialCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationMaterialCostInstance.version > version) {
                identificationMaterialCostInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost')] as Object[],
                          "Another user has updated this IdentificationMaterialCost while you were editing")
                render(view: "edit", model: [identificationMaterialCostInstance: identificationMaterialCostInstance])
                return
            }
        }

        identificationMaterialCostInstance.properties = params

        if (!identificationMaterialCostInstance.save(flush: true)) {
            render(view: "edit", model: [identificationMaterialCostInstance: identificationMaterialCostInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), identificationMaterialCostInstance.id])
        redirect(action: "show", id: identificationMaterialCostInstance.id)
    }

    def delete(Long id) {
        def identificationMaterialCostInstance = IdentificationMaterialCost.get(id)
        if (!identificationMaterialCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationMaterialCostInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost'), id])
            redirect(action: "show", id: id)
        }
    }
}
