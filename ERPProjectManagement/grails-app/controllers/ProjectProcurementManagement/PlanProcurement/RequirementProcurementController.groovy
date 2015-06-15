package ProjectProcurementManagement.PlanProcurement

import org.springframework.dao.DataIntegrityViolationException

class RequirementProcurementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requirementProcurementInstanceList: RequirementProcurement.list(params), requirementProcurementInstanceTotal: RequirementProcurement.count()]
    }

    def create() {
        [requirementProcurementInstance: new RequirementProcurement(params)]
    }

    def save() {
        def requirementProcurementInstance = new RequirementProcurement(params)
        if (!requirementProcurementInstance.save(flush: true)) {
            render(view: "create", model: [requirementProcurementInstance: requirementProcurementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), requirementProcurementInstance.id])
        redirect(action: "show", id: requirementProcurementInstance.id)
    }

    def show(Long id) {
        def requirementProcurementInstance = RequirementProcurement.get(id)
        if (!requirementProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), id])
            redirect(action: "list")
            return
        }

        [requirementProcurementInstance: requirementProcurementInstance]
    }

    def edit(Long id) {
        def requirementProcurementInstance = RequirementProcurement.get(id)
        if (!requirementProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), id])
            redirect(action: "list")
            return
        }

        [requirementProcurementInstance: requirementProcurementInstance]
    }

    def update(Long id, Long version) {
        def requirementProcurementInstance = RequirementProcurement.get(id)
        if (!requirementProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requirementProcurementInstance.version > version) {
                requirementProcurementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requirementProcurement.label', default: 'RequirementProcurement')] as Object[],
                          "Another user has updated this RequirementProcurement while you were editing")
                render(view: "edit", model: [requirementProcurementInstance: requirementProcurementInstance])
                return
            }
        }

        requirementProcurementInstance.properties = params

        if (!requirementProcurementInstance.save(flush: true)) {
            render(view: "edit", model: [requirementProcurementInstance: requirementProcurementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), requirementProcurementInstance.id])
        redirect(action: "show", id: requirementProcurementInstance.id)
    }

    def delete(Long id) {
        def requirementProcurementInstance = RequirementProcurement.get(id)
        if (!requirementProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), id])
            redirect(action: "list")
            return
        }

        try {
            requirementProcurementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement'), id])
            redirect(action: "show", id: id)
        }
    }
}
