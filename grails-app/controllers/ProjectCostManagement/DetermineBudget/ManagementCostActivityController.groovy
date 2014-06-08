package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class ManagementCostActivityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [managementCostActivityInstanceList: ManagementCostActivity.list(params), managementCostActivityInstanceTotal: ManagementCostActivity.count()]
    }

    def create() {
        [managementCostActivityInstance: new ManagementCostActivity(params)]
    }

    def save() {
        def managementCostActivityInstance = new ManagementCostActivity(params)
        if (!managementCostActivityInstance.save(flush: true)) {
            render(view: "create", model: [managementCostActivityInstance: managementCostActivityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), managementCostActivityInstance.id])
        redirect(action: "show", id: managementCostActivityInstance.id)
    }

    def show(Long id) {
        def managementCostActivityInstance = ManagementCostActivity.get(id)
        if (!managementCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), id])
            redirect(action: "list")
            return
        }

        [managementCostActivityInstance: managementCostActivityInstance]
    }

    def edit(Long id) {
        def managementCostActivityInstance = ManagementCostActivity.get(id)
        if (!managementCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), id])
            redirect(action: "list")
            return
        }

        [managementCostActivityInstance: managementCostActivityInstance]
    }

    def update(Long id, Long version) {
        def managementCostActivityInstance = ManagementCostActivity.get(id)
        if (!managementCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (managementCostActivityInstance.version > version) {
                managementCostActivityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity')] as Object[],
                          "Another user has updated this ManagementCostActivity while you were editing")
                render(view: "edit", model: [managementCostActivityInstance: managementCostActivityInstance])
                return
            }
        }

        managementCostActivityInstance.properties = params

        if (!managementCostActivityInstance.save(flush: true)) {
            render(view: "edit", model: [managementCostActivityInstance: managementCostActivityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), managementCostActivityInstance.id])
        redirect(action: "show", id: managementCostActivityInstance.id)
    }

    def delete(Long id) {
        def managementCostActivityInstance = ManagementCostActivity.get(id)
        if (!managementCostActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), id])
            redirect(action: "list")
            return
        }

        try {
            managementCostActivityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity'), id])
            redirect(action: "show", id: id)
        }
    }
}
