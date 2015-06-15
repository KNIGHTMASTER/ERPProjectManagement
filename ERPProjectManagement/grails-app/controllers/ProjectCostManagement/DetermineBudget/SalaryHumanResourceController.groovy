package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class SalaryHumanResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [salaryHumanResourceInstanceList: SalaryHumanResource.list(params), salaryHumanResourceInstanceTotal: SalaryHumanResource.count()]
    }

    def create() {
        [salaryHumanResourceInstance: new SalaryHumanResource(params)]
    }

    def save() {
        def salaryHumanResourceInstance = new SalaryHumanResource(params)
        if (!salaryHumanResourceInstance.save(flush: true)) {
            render(view: "create", model: [salaryHumanResourceInstance: salaryHumanResourceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), salaryHumanResourceInstance.id])
        redirect(action: "show", id: salaryHumanResourceInstance.id)
    }

    def show(Long id) {
        def salaryHumanResourceInstance = SalaryHumanResource.get(id)
        if (!salaryHumanResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), id])
            redirect(action: "list")
            return
        }

        [salaryHumanResourceInstance: salaryHumanResourceInstance]
    }

    def edit(Long id) {
        def salaryHumanResourceInstance = SalaryHumanResource.get(id)
        if (!salaryHumanResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), id])
            redirect(action: "list")
            return
        }

        [salaryHumanResourceInstance: salaryHumanResourceInstance]
    }

    def update(Long id, Long version) {
        def salaryHumanResourceInstance = SalaryHumanResource.get(id)
        if (!salaryHumanResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (salaryHumanResourceInstance.version > version) {
                salaryHumanResourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource')] as Object[],
                          "Another user has updated this SalaryHumanResource while you were editing")
                render(view: "edit", model: [salaryHumanResourceInstance: salaryHumanResourceInstance])
                return
            }
        }

        salaryHumanResourceInstance.properties = params

        if (!salaryHumanResourceInstance.save(flush: true)) {
            render(view: "edit", model: [salaryHumanResourceInstance: salaryHumanResourceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), salaryHumanResourceInstance.id])
        redirect(action: "show", id: salaryHumanResourceInstance.id)
    }

    def delete(Long id) {
        def salaryHumanResourceInstance = SalaryHumanResource.get(id)
        if (!salaryHumanResourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), id])
            redirect(action: "list")
            return
        }

        try {
            salaryHumanResourceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource'), id])
            redirect(action: "show", id: id)
        }
    }
}
