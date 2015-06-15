package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationCostManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationCostManagementPlanInstanceList: IdentificationCostManagementPlan.list(params), identificationCostManagementPlanInstanceTotal: IdentificationCostManagementPlan.count()]
    }

    def create() {
        [identificationCostManagementPlanInstance: new IdentificationCostManagementPlan(params)]
    }

    def save() {
        def identificationCostManagementPlanInstance = new IdentificationCostManagementPlan(params)
        if (!identificationCostManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [identificationCostManagementPlanInstance: identificationCostManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), identificationCostManagementPlanInstance.id])
        redirect(action: "show", id: identificationCostManagementPlanInstance.id)
    }

    def show(Long id) {
        def identificationCostManagementPlanInstance = IdentificationCostManagementPlan.get(id)
        if (!identificationCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [identificationCostManagementPlanInstance: identificationCostManagementPlanInstance]
    }

    def edit(Long id) {
        def identificationCostManagementPlanInstance = IdentificationCostManagementPlan.get(id)
        if (!identificationCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [identificationCostManagementPlanInstance: identificationCostManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def identificationCostManagementPlanInstance = IdentificationCostManagementPlan.get(id)
        if (!identificationCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationCostManagementPlanInstance.version > version) {
                identificationCostManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan')] as Object[],
                          "Another user has updated this IdentificationCostManagementPlan while you were editing")
                render(view: "edit", model: [identificationCostManagementPlanInstance: identificationCostManagementPlanInstance])
                return
            }
        }

        identificationCostManagementPlanInstance.properties = params

        if (!identificationCostManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [identificationCostManagementPlanInstance: identificationCostManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), identificationCostManagementPlanInstance.id])
        redirect(action: "show", id: identificationCostManagementPlanInstance.id)
    }

    def delete(Long id) {
        def identificationCostManagementPlanInstance = IdentificationCostManagementPlan.get(id)
        if (!identificationCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationCostManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
