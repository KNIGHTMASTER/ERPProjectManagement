package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class CostManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [costManagementPlanInstanceList: CostManagementPlan.list(params), costManagementPlanInstanceTotal: CostManagementPlan.count()]
    }

    def create() {
        [costManagementPlanInstance: new CostManagementPlan(params)]
    }

    def save() {
        def costManagementPlanInstance = new CostManagementPlan(params)
        if (!costManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [costManagementPlanInstance: costManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), costManagementPlanInstance.id])
        redirect(action: "show", id: costManagementPlanInstance.id)
    }

    def show(Long id) {
        def costManagementPlanInstance = CostManagementPlan.get(id)
        if (!costManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [costManagementPlanInstance: costManagementPlanInstance]
    }

    def edit(Long id) {
        def costManagementPlanInstance = CostManagementPlan.get(id)
        if (!costManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [costManagementPlanInstance: costManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def costManagementPlanInstance = CostManagementPlan.get(id)
        if (!costManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (costManagementPlanInstance.version > version) {
                costManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'costManagementPlan.label', default: 'CostManagementPlan')] as Object[],
                          "Another user has updated this CostManagementPlan while you were editing")
                render(view: "edit", model: [costManagementPlanInstance: costManagementPlanInstance])
                return
            }
        }

        costManagementPlanInstance.properties = params

        if (!costManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [costManagementPlanInstance: costManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), costManagementPlanInstance.id])
        redirect(action: "show", id: costManagementPlanInstance.id)
    }

    def delete(Long id) {
        def costManagementPlanInstance = CostManagementPlan.get(id)
        if (!costManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            costManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
