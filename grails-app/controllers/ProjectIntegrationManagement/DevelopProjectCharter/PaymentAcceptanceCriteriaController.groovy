package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class PaymentAcceptanceCriteriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [paymentAcceptanceCriteriaInstanceList: PaymentAcceptanceCriteria.list(params), paymentAcceptanceCriteriaInstanceTotal: PaymentAcceptanceCriteria.count()]
    }

    def create() {
        [paymentAcceptanceCriteriaInstance: new PaymentAcceptanceCriteria(params)]
    }

    def save() {
        def paymentAcceptanceCriteriaInstance = new PaymentAcceptanceCriteria(params)
        if (!paymentAcceptanceCriteriaInstance.save(flush: true)) {
            render(view: "create", model: [paymentAcceptanceCriteriaInstance: paymentAcceptanceCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), paymentAcceptanceCriteriaInstance.id])
        redirect(action: "show", id: paymentAcceptanceCriteriaInstance.id)
    }

    def show(Long id) {
        def paymentAcceptanceCriteriaInstance = PaymentAcceptanceCriteria.get(id)
        if (!paymentAcceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        [paymentAcceptanceCriteriaInstance: paymentAcceptanceCriteriaInstance]
    }

    def edit(Long id) {
        def paymentAcceptanceCriteriaInstance = PaymentAcceptanceCriteria.get(id)
        if (!paymentAcceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        [paymentAcceptanceCriteriaInstance: paymentAcceptanceCriteriaInstance]
    }

    def update(Long id, Long version) {
        def paymentAcceptanceCriteriaInstance = PaymentAcceptanceCriteria.get(id)
        if (!paymentAcceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (paymentAcceptanceCriteriaInstance.version > version) {
                paymentAcceptanceCriteriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria')] as Object[],
                          "Another user has updated this PaymentAcceptanceCriteria while you were editing")
                render(view: "edit", model: [paymentAcceptanceCriteriaInstance: paymentAcceptanceCriteriaInstance])
                return
            }
        }

        paymentAcceptanceCriteriaInstance.properties = params

        if (!paymentAcceptanceCriteriaInstance.save(flush: true)) {
            render(view: "edit", model: [paymentAcceptanceCriteriaInstance: paymentAcceptanceCriteriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), paymentAcceptanceCriteriaInstance.id])
        redirect(action: "show", id: paymentAcceptanceCriteriaInstance.id)
    }

    def delete(Long id) {
        def paymentAcceptanceCriteriaInstance = PaymentAcceptanceCriteria.get(id)
        if (!paymentAcceptanceCriteriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), id])
            redirect(action: "list")
            return
        }

        try {
            paymentAcceptanceCriteriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria'), id])
            redirect(action: "show", id: id)
        }
    }
}
