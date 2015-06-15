package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class ManagementCostUseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [managementCostUseInstanceList: ManagementCostUse.list(params), managementCostUseInstanceTotal: ManagementCostUse.count()]
    }

    def create() {
        [managementCostUseInstance: new ManagementCostUse(params)]
    }

    def save() {
        def managementCostUseInstance = new ManagementCostUse(params)
        if (!managementCostUseInstance.save(flush: true)) {
            render(view: "create", model: [managementCostUseInstance: managementCostUseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), managementCostUseInstance.id])
        redirect(action: "show", id: managementCostUseInstance.id)
    }

    def show(Long id) {
        def managementCostUseInstance = ManagementCostUse.get(id)
        if (!managementCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), id])
            redirect(action: "list")
            return
        }

        [managementCostUseInstance: managementCostUseInstance]
    }

    def edit(Long id) {
        def managementCostUseInstance = ManagementCostUse.get(id)
        if (!managementCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), id])
            redirect(action: "list")
            return
        }

        [managementCostUseInstance: managementCostUseInstance]
    }

    def update(Long id, Long version) {
        def managementCostUseInstance = ManagementCostUse.get(id)
        if (!managementCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (managementCostUseInstance.version > version) {
                managementCostUseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'managementCostUse.label', default: 'ManagementCostUse')] as Object[],
                          "Another user has updated this ManagementCostUse while you were editing")
                render(view: "edit", model: [managementCostUseInstance: managementCostUseInstance])
                return
            }
        }

        managementCostUseInstance.properties = params

        if (!managementCostUseInstance.save(flush: true)) {
            render(view: "edit", model: [managementCostUseInstance: managementCostUseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), managementCostUseInstance.id])
        redirect(action: "show", id: managementCostUseInstance.id)
    }

    def delete(Long id) {
        def managementCostUseInstance = ManagementCostUse.get(id)
        if (!managementCostUseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), id])
            redirect(action: "list")
            return
        }

        try {
            managementCostUseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse'), id])
            redirect(action: "show", id: id)
        }
    }
}
