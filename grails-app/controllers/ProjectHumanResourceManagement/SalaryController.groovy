package ProjectHumanResourceManagement

import org.springframework.dao.DataIntegrityViolationException

class SalaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [salaryInstanceList: Salary.list(params), salaryInstanceTotal: Salary.count()]
    }

    def create() {
        [salaryInstance: new Salary(params)]
    }

    def save() {
        def salaryInstance = new Salary(params)
        if (!salaryInstance.save(flush: true)) {
            render(view: "create", model: [salaryInstance: salaryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'salary.label', default: 'Salary'), salaryInstance.id])
        redirect(action: "show", id: salaryInstance.id)
    }

    def show(Long id) {
        def salaryInstance = Salary.get(id)
        if (!salaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salary.label', default: 'Salary'), id])
            redirect(action: "list")
            return
        }

        [salaryInstance: salaryInstance]
    }

    def edit(Long id) {
        def salaryInstance = Salary.get(id)
        if (!salaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salary.label', default: 'Salary'), id])
            redirect(action: "list")
            return
        }

        [salaryInstance: salaryInstance]
    }

    def update(Long id, Long version) {
        def salaryInstance = Salary.get(id)
        if (!salaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salary.label', default: 'Salary'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (salaryInstance.version > version) {
                salaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'salary.label', default: 'Salary')] as Object[],
                        "Another user has updated this Salary while you were editing")
                render(view: "edit", model: [salaryInstance: salaryInstance])
                return
            }
        }

        salaryInstance.properties = params

        if (!salaryInstance.save(flush: true)) {
            render(view: "edit", model: [salaryInstance: salaryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'salary.label', default: 'Salary'), salaryInstance.id])
        redirect(action: "show", id: salaryInstance.id)
    }

    def delete(Long id) {
        def salaryInstance = Salary.get(id)
        if (!salaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salary.label', default: 'Salary'), id])
            redirect(action: "list")
            return
        }

        try {
            salaryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'salary.label', default: 'Salary'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'salary.label', default: 'Salary'), id])
            redirect(action: "show", id: id)
        }
    }
}
