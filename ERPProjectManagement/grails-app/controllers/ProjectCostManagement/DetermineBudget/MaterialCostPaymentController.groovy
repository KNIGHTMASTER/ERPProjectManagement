package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class MaterialCostPaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialCostPaymentInstanceList: MaterialCostPayment.list(params), materialCostPaymentInstanceTotal: MaterialCostPayment.count()]
    }

    def create() {
        [materialCostPaymentInstance: new MaterialCostPayment(params)]
    }

    def save() {
        def materialCostPaymentInstance = new MaterialCostPayment(params)
        if (!materialCostPaymentInstance.save(flush: true)) {
            render(view: "create", model: [materialCostPaymentInstance: materialCostPaymentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), materialCostPaymentInstance.id])
        redirect(action: "show", id: materialCostPaymentInstance.id)
    }

    def show(Long id) {
        def materialCostPaymentInstance = MaterialCostPayment.get(id)
        if (!materialCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), id])
            redirect(action: "list")
            return
        }

        [materialCostPaymentInstance: materialCostPaymentInstance]
    }

    def edit(Long id) {
        def materialCostPaymentInstance = MaterialCostPayment.get(id)
        if (!materialCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), id])
            redirect(action: "list")
            return
        }

        [materialCostPaymentInstance: materialCostPaymentInstance]
    }

    def update(Long id, Long version) {
        def materialCostPaymentInstance = MaterialCostPayment.get(id)
        if (!materialCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialCostPaymentInstance.version > version) {
                materialCostPaymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment')] as Object[],
                          "Another user has updated this MaterialCostPayment while you were editing")
                render(view: "edit", model: [materialCostPaymentInstance: materialCostPaymentInstance])
                return
            }
        }

        materialCostPaymentInstance.properties = params

        if (!materialCostPaymentInstance.save(flush: true)) {
            render(view: "edit", model: [materialCostPaymentInstance: materialCostPaymentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), materialCostPaymentInstance.id])
        redirect(action: "show", id: materialCostPaymentInstance.id)
    }

    def delete(Long id) {
        def materialCostPaymentInstance = MaterialCostPayment.get(id)
        if (!materialCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), id])
            redirect(action: "list")
            return
        }

        try {
            materialCostPaymentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment'), id])
            redirect(action: "show", id: id)
        }
    }
}
