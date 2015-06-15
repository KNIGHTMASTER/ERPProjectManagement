package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class FinanceOcmController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [financeOcmInstanceList: FinanceOcm.list(params), financeOcmInstanceTotal: FinanceOcm.count()]
    }

    def create() {
        [financeOcmInstance: new FinanceOcm(params)]
    }

    def save() {
        def financeOcmInstance = new FinanceOcm(params)
        if (!financeOcmInstance.save(flush: true)) {
            render(view: "create", model: [financeOcmInstance: financeOcmInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), financeOcmInstance.id])
        redirect(action: "show", id: financeOcmInstance.id)
    }

    def show(Long id) {
        def financeOcmInstance = FinanceOcm.get(id)
        if (!financeOcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), id])
            redirect(action: "list")
            return
        }

        [financeOcmInstance: financeOcmInstance]
    }

    def edit(Long id) {
        def financeOcmInstance = FinanceOcm.get(id)
        if (!financeOcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), id])
            redirect(action: "list")
            return
        }

        [financeOcmInstance: financeOcmInstance]
    }

    def update(Long id, Long version) {
        def financeOcmInstance = FinanceOcm.get(id)
        if (!financeOcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (financeOcmInstance.version > version) {
                financeOcmInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'financeOcm.label', default: 'FinanceOcm')] as Object[],
                          "Another user has updated this FinanceOcm while you were editing")
                render(view: "edit", model: [financeOcmInstance: financeOcmInstance])
                return
            }
        }

        financeOcmInstance.properties = params

        if (!financeOcmInstance.save(flush: true)) {
            render(view: "edit", model: [financeOcmInstance: financeOcmInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), financeOcmInstance.id])
        redirect(action: "show", id: financeOcmInstance.id)
    }

    def delete(Long id) {
        def financeOcmInstance = FinanceOcm.get(id)
        if (!financeOcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), id])
            redirect(action: "list")
            return
        }

        try {
            financeOcmInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'financeOcm.label', default: 'FinanceOcm'), id])
            redirect(action: "show", id: id)
        }
    }
}
