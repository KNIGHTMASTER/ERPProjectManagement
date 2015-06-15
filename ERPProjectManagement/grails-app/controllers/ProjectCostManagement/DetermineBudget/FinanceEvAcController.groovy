package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class FinanceEvAcController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [financeEvAcInstanceList: FinanceEvAc.list(params), financeEvAcInstanceTotal: FinanceEvAc.count()]
    }

    def create() {
        [financeEvAcInstance: new FinanceEvAc(params)]
    }

    def save() {
        def financeEvAcInstance = new FinanceEvAc(params)
        if (!financeEvAcInstance.save(flush: true)) {
            render(view: "create", model: [financeEvAcInstance: financeEvAcInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), financeEvAcInstance.id])
        redirect(action: "show", id: financeEvAcInstance.id)
    }

    def show(Long id) {
        def financeEvAcInstance = FinanceEvAc.get(id)
        if (!financeEvAcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), id])
            redirect(action: "list")
            return
        }

        [financeEvAcInstance: financeEvAcInstance]
    }

    def edit(Long id) {
        def financeEvAcInstance = FinanceEvAc.get(id)
        if (!financeEvAcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), id])
            redirect(action: "list")
            return
        }

        [financeEvAcInstance: financeEvAcInstance]
    }

    def update(Long id, Long version) {
        def financeEvAcInstance = FinanceEvAc.get(id)
        if (!financeEvAcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (financeEvAcInstance.version > version) {
                financeEvAcInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'financeEvAc.label', default: 'FinanceEvAc')] as Object[],
                          "Another user has updated this FinanceEvAc while you were editing")
                render(view: "edit", model: [financeEvAcInstance: financeEvAcInstance])
                return
            }
        }

        financeEvAcInstance.properties = params

        if (!financeEvAcInstance.save(flush: true)) {
            render(view: "edit", model: [financeEvAcInstance: financeEvAcInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), financeEvAcInstance.id])
        redirect(action: "show", id: financeEvAcInstance.id)
    }

    def delete(Long id) {
        def financeEvAcInstance = FinanceEvAc.get(id)
        if (!financeEvAcInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), id])
            redirect(action: "list")
            return
        }

        try {
            financeEvAcInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'financeEvAc.label', default: 'FinanceEvAc'), id])
            redirect(action: "show", id: id)
        }
    }
}
