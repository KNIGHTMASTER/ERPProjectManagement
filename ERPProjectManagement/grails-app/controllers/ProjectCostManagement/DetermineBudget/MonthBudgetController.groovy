package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class MonthBudgetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [monthBudgetInstanceList: MonthBudget.list(params), monthBudgetInstanceTotal: MonthBudget.count()]
    }

    def create() {
        [monthBudgetInstance: new MonthBudget(params)]
    }

    def save() {
        def monthBudgetInstance = new MonthBudget(params)
        if (!monthBudgetInstance.save(flush: true)) {
            render(view: "create", model: [monthBudgetInstance: monthBudgetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), monthBudgetInstance.id])
        redirect(action: "show", id: monthBudgetInstance.id)
    }

    def show(Long id) {
        def monthBudgetInstance = MonthBudget.get(id)
        if (!monthBudgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), id])
            redirect(action: "list")
            return
        }

        [monthBudgetInstance: monthBudgetInstance]
    }

    def edit(Long id) {
        def monthBudgetInstance = MonthBudget.get(id)
        if (!monthBudgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), id])
            redirect(action: "list")
            return
        }

        [monthBudgetInstance: monthBudgetInstance]
    }

    def update(Long id, Long version) {
        def monthBudgetInstance = MonthBudget.get(id)
        if (!monthBudgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (monthBudgetInstance.version > version) {
                monthBudgetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'monthBudget.label', default: 'MonthBudget')] as Object[],
                          "Another user has updated this MonthBudget while you were editing")
                render(view: "edit", model: [monthBudgetInstance: monthBudgetInstance])
                return
            }
        }

        monthBudgetInstance.properties = params

        if (!monthBudgetInstance.save(flush: true)) {
            render(view: "edit", model: [monthBudgetInstance: monthBudgetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), monthBudgetInstance.id])
        redirect(action: "show", id: monthBudgetInstance.id)
    }

    def delete(Long id) {
        def monthBudgetInstance = MonthBudget.get(id)
        if (!monthBudgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), id])
            redirect(action: "list")
            return
        }

        try {
            monthBudgetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'monthBudget.label', default: 'MonthBudget'), id])
            redirect(action: "show", id: id)
        }
    }
}
