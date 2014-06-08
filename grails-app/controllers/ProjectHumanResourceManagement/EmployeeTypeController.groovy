package ProjectHumanResourceManagement

import org.springframework.dao.DataIntegrityViolationException

class EmployeeTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [employeeTypeInstanceList: EmployeeType.list(params), employeeTypeInstanceTotal: EmployeeType.count()]
    }

    def create() {
        [employeeTypeInstance: new EmployeeType(params)]
    }

    def save() {
        def employeeTypeInstance = new EmployeeType(params)
        if (!employeeTypeInstance.save(flush: true)) {
            render(view: "create", model: [employeeTypeInstance: employeeTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), employeeTypeInstance.id])
        redirect(action: "show", id: employeeTypeInstance.id)
    }

    def show(Long id) {
        def employeeTypeInstance = EmployeeType.get(id)
        if (!employeeTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), id])
            redirect(action: "list")
            return
        }

        [employeeTypeInstance: employeeTypeInstance]
    }

    def edit(Long id) {
        def employeeTypeInstance = EmployeeType.get(id)
        if (!employeeTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), id])
            redirect(action: "list")
            return
        }

        [employeeTypeInstance: employeeTypeInstance]
    }

    def update(Long id, Long version) {
        def employeeTypeInstance = EmployeeType.get(id)
        if (!employeeTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (employeeTypeInstance.version > version) {
                employeeTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'employeeType.label', default: 'EmployeeType')] as Object[],
                          "Another user has updated this EmployeeType while you were editing")
                render(view: "edit", model: [employeeTypeInstance: employeeTypeInstance])
                return
            }
        }

        employeeTypeInstance.properties = params

        if (!employeeTypeInstance.save(flush: true)) {
            render(view: "edit", model: [employeeTypeInstance: employeeTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), employeeTypeInstance.id])
        redirect(action: "show", id: employeeTypeInstance.id)
    }

    def delete(Long id) {
        def employeeTypeInstance = EmployeeType.get(id)
        if (!employeeTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), id])
            redirect(action: "list")
            return
        }

        try {
            employeeTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employeeType.label', default: 'EmployeeType'), id])
            redirect(action: "show", id: id)
        }
    }
}
