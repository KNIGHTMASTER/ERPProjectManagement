package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class ManagementCostPaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [managementCostPaymentInstanceList: ManagementCostPayment.list(params), managementCostPaymentInstanceTotal: ManagementCostPayment.count()]
    }

    def create() {
        [managementCostPaymentInstance: new ManagementCostPayment(params)]
    }

    def save() {
        def managementCostPaymentInstance = new ManagementCostPayment(params)
        if (!managementCostPaymentInstance.save(flush: true)) {
            render(view: "create", model: [managementCostPaymentInstance: managementCostPaymentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), managementCostPaymentInstance.id])
        redirect(action: "show", id: managementCostPaymentInstance.id)
    }

    def show(Long id) {
        def managementCostPaymentInstance = ManagementCostPayment.get(id)
        if (!managementCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), id])
            redirect(action: "list")
            return
        }

        [managementCostPaymentInstance: managementCostPaymentInstance]
    }

    def edit(Long id) {
        def managementCostPaymentInstance = ManagementCostPayment.get(id)
        if (!managementCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), id])
            redirect(action: "list")
            return
        }

        [managementCostPaymentInstance: managementCostPaymentInstance]
    }

    def update(Long id, Long version) {
        def managementCostPaymentInstance = ManagementCostPayment.get(id)
        if (!managementCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (managementCostPaymentInstance.version > version) {
                managementCostPaymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment')] as Object[],
                          "Another user has updated this ManagementCostPayment while you were editing")
                render(view: "edit", model: [managementCostPaymentInstance: managementCostPaymentInstance])
                return
            }
        }

        managementCostPaymentInstance.properties = params

        if (!managementCostPaymentInstance.save(flush: true)) {
            render(view: "edit", model: [managementCostPaymentInstance: managementCostPaymentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), managementCostPaymentInstance.id])
        redirect(action: "show", id: managementCostPaymentInstance.id)
    }

    def delete(Long id) {
        def managementCostPaymentInstance = ManagementCostPayment.get(id)
        if (!managementCostPaymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), id])
            redirect(action: "list")
            return
        }

        try {
            managementCostPaymentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment'), id])
            redirect(action: "show", id: id)
        }
    }
}
