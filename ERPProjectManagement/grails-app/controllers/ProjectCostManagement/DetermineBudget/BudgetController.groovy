package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class BudgetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [budgetInstanceList: Budget.list(params), budgetInstanceTotal: Budget.count()]
    }

    def create() {
        [budgetInstance: new Budget(params)]
    }

    def save() {
        def budgetInstance = new Budget(params)
        if (!budgetInstance.save(flush: true)) {
            render(view: "create", model: [budgetInstance: budgetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'budget.label', default: 'Budget'), budgetInstance.id])
        redirect(action: "show", id: budgetInstance.id)
    }

    def show(Long id) {
        def budgetInstance = Budget.get(id)
        if (!budgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), id])
            redirect(action: "list")
            return
        }

        [budgetInstance: budgetInstance]
    }

    def edit(Long id) {
        def budgetInstance = Budget.get(id)
        if (!budgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), id])
            redirect(action: "list")
            return
        }

        [budgetInstance: budgetInstance]
    }

    def update(Long id, Long version) {
        def budgetInstance = Budget.get(id)
        if (!budgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (budgetInstance.version > version) {
                budgetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'budget.label', default: 'Budget')] as Object[],
                          "Another user has updated this Budget while you were editing")
                render(view: "edit", model: [budgetInstance: budgetInstance])
                return
            }
        }

        budgetInstance.properties = params

        if (!budgetInstance.save(flush: true)) {
            render(view: "edit", model: [budgetInstance: budgetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'budget.label', default: 'Budget'), budgetInstance.id])
        redirect(action: "show", id: budgetInstance.id)
    }

    def delete(Long id) {
        def budgetInstance = Budget.get(id)
        if (!budgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'budget.label', default: 'Budget'), id])
            redirect(action: "list")
            return
        }

        try {
            budgetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'budget.label', default: 'Budget'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'budget.label', default: 'Budget'), id])
            redirect(action: "show", id: id)
        }
    }
}
