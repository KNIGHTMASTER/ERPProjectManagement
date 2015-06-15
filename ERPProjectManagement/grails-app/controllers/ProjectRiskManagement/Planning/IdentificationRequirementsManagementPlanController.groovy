package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationRequirementsManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationRequirementsManagementPlanInstanceList: IdentificationRequirementsManagementPlan.list(params), identificationRequirementsManagementPlanInstanceTotal: IdentificationRequirementsManagementPlan.count()]
    }

    def create() {
        [identificationRequirementsManagementPlanInstance: new IdentificationRequirementsManagementPlan(params)]
    }

    def save() {
        def identificationRequirementsManagementPlanInstance = new IdentificationRequirementsManagementPlan(params)
        if (!identificationRequirementsManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [identificationRequirementsManagementPlanInstance: identificationRequirementsManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), identificationRequirementsManagementPlanInstance.id])
        redirect(action: "show", id: identificationRequirementsManagementPlanInstance.id)
    }

    def show(Long id) {
        def identificationRequirementsManagementPlanInstance = IdentificationRequirementsManagementPlan.get(id)
        if (!identificationRequirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [identificationRequirementsManagementPlanInstance: identificationRequirementsManagementPlanInstance]
    }

    def edit(Long id) {
        def identificationRequirementsManagementPlanInstance = IdentificationRequirementsManagementPlan.get(id)
        if (!identificationRequirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [identificationRequirementsManagementPlanInstance: identificationRequirementsManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def identificationRequirementsManagementPlanInstance = IdentificationRequirementsManagementPlan.get(id)
        if (!identificationRequirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationRequirementsManagementPlanInstance.version > version) {
                identificationRequirementsManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan')] as Object[],
                          "Another user has updated this IdentificationRequirementsManagementPlan while you were editing")
                render(view: "edit", model: [identificationRequirementsManagementPlanInstance: identificationRequirementsManagementPlanInstance])
                return
            }
        }

        identificationRequirementsManagementPlanInstance.properties = params

        if (!identificationRequirementsManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [identificationRequirementsManagementPlanInstance: identificationRequirementsManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), identificationRequirementsManagementPlanInstance.id])
        redirect(action: "show", id: identificationRequirementsManagementPlanInstance.id)
    }

    def delete(Long id) {
        def identificationRequirementsManagementPlanInstance = IdentificationRequirementsManagementPlan.get(id)
        if (!identificationRequirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationRequirementsManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
