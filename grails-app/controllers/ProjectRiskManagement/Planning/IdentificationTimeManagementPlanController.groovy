package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationTimeManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationTimeManagementPlanInstanceList: IdentificationTimeManagementPlan.list(params), identificationTimeManagementPlanInstanceTotal: IdentificationTimeManagementPlan.count()]
    }

    def create() {
        [identificationTimeManagementPlanInstance: new IdentificationTimeManagementPlan(params)]
    }

    def save() {
        def identificationTimeManagementPlanInstance = new IdentificationTimeManagementPlan(params)
        if (!identificationTimeManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [identificationTimeManagementPlanInstance: identificationTimeManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), identificationTimeManagementPlanInstance.id])
        redirect(action: "show", id: identificationTimeManagementPlanInstance.id)
    }

    def show(Long id) {
        def identificationTimeManagementPlanInstance = IdentificationTimeManagementPlan.get(id)
        if (!identificationTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [identificationTimeManagementPlanInstance: identificationTimeManagementPlanInstance]
    }

    def edit(Long id) {
        def identificationTimeManagementPlanInstance = IdentificationTimeManagementPlan.get(id)
        if (!identificationTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [identificationTimeManagementPlanInstance: identificationTimeManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def identificationTimeManagementPlanInstance = IdentificationTimeManagementPlan.get(id)
        if (!identificationTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationTimeManagementPlanInstance.version > version) {
                identificationTimeManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan')] as Object[],
                          "Another user has updated this IdentificationTimeManagementPlan while you were editing")
                render(view: "edit", model: [identificationTimeManagementPlanInstance: identificationTimeManagementPlanInstance])
                return
            }
        }

        identificationTimeManagementPlanInstance.properties = params

        if (!identificationTimeManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [identificationTimeManagementPlanInstance: identificationTimeManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), identificationTimeManagementPlanInstance.id])
        redirect(action: "show", id: identificationTimeManagementPlanInstance.id)
    }

    def delete(Long id) {
        def identificationTimeManagementPlanInstance = IdentificationTimeManagementPlan.get(id)
        if (!identificationTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationTimeManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
