package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class FinanceEvAcManagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [financeEvAcManagInstanceList: FinanceEvAcManag.list(params), financeEvAcManagInstanceTotal: FinanceEvAcManag.count()]
    }

    def create() {
        [financeEvAcManagInstance: new FinanceEvAcManag(params)]
    }

    def save() {
        def financeEvAcManagInstance = new FinanceEvAcManag(params)
        if (!financeEvAcManagInstance.save(flush: true)) {
            render(view: "create", model: [financeEvAcManagInstance: financeEvAcManagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), financeEvAcManagInstance.id])
        redirect(action: "show", id: financeEvAcManagInstance.id)
    }

    def show(Long id) {
        def financeEvAcManagInstance = FinanceEvAcManag.get(id)
        if (!financeEvAcManagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), id])
            redirect(action: "list")
            return
        }

        [financeEvAcManagInstance: financeEvAcManagInstance]
    }

    def edit(Long id) {
        def financeEvAcManagInstance = FinanceEvAcManag.get(id)
        if (!financeEvAcManagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), id])
            redirect(action: "list")
            return
        }

        [financeEvAcManagInstance: financeEvAcManagInstance]
    }

    def update(Long id, Long version) {
        def financeEvAcManagInstance = FinanceEvAcManag.get(id)
        if (!financeEvAcManagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (financeEvAcManagInstance.version > version) {
                financeEvAcManagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag')] as Object[],
                          "Another user has updated this FinanceEvAcManag while you were editing")
                render(view: "edit", model: [financeEvAcManagInstance: financeEvAcManagInstance])
                return
            }
        }

        financeEvAcManagInstance.properties = params

        if (!financeEvAcManagInstance.save(flush: true)) {
            render(view: "edit", model: [financeEvAcManagInstance: financeEvAcManagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), financeEvAcManagInstance.id])
        redirect(action: "show", id: financeEvAcManagInstance.id)
    }

    def delete(Long id) {
        def financeEvAcManagInstance = FinanceEvAcManag.get(id)
        if (!financeEvAcManagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), id])
            redirect(action: "list")
            return
        }

        try {
            financeEvAcManagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag'), id])
            redirect(action: "show", id: id)
        }
    }
}
