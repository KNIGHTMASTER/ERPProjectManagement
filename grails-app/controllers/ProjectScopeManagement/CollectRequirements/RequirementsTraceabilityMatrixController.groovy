package ProjectScopeManagement.CollectRequirements

import org.springframework.dao.DataIntegrityViolationException

class RequirementsTraceabilityMatrixController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requirementsTraceabilityMatrixInstanceList: RequirementsTraceabilityMatrix.list(params), requirementsTraceabilityMatrixInstanceTotal: RequirementsTraceabilityMatrix.count()]
    }

    def create() {
        [requirementsTraceabilityMatrixInstance: new RequirementsTraceabilityMatrix(params)]
    }

    def save() {
        def requirementsTraceabilityMatrixInstance = new RequirementsTraceabilityMatrix(params)
        if (!requirementsTraceabilityMatrixInstance.save(flush: true)) {
            render(view: "create", model: [requirementsTraceabilityMatrixInstance: requirementsTraceabilityMatrixInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), requirementsTraceabilityMatrixInstance.id])
        redirect(action: "show", id: requirementsTraceabilityMatrixInstance.id)
    }

    def show(Long id) {
        def requirementsTraceabilityMatrixInstance = RequirementsTraceabilityMatrix.get(id)
        if (!requirementsTraceabilityMatrixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), id])
            redirect(action: "list")
            return
        }

        [requirementsTraceabilityMatrixInstance: requirementsTraceabilityMatrixInstance]
    }

    def edit(Long id) {
        def requirementsTraceabilityMatrixInstance = RequirementsTraceabilityMatrix.get(id)
        if (!requirementsTraceabilityMatrixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), id])
            redirect(action: "list")
            return
        }

        [requirementsTraceabilityMatrixInstance: requirementsTraceabilityMatrixInstance]
    }

    def update(Long id, Long version) {
        def requirementsTraceabilityMatrixInstance = RequirementsTraceabilityMatrix.get(id)
        if (!requirementsTraceabilityMatrixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requirementsTraceabilityMatrixInstance.version > version) {
                requirementsTraceabilityMatrixInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix')] as Object[],
                          "Another user has updated this RequirementsTraceabilityMatrix while you were editing")
                render(view: "edit", model: [requirementsTraceabilityMatrixInstance: requirementsTraceabilityMatrixInstance])
                return
            }
        }

        requirementsTraceabilityMatrixInstance.properties = params

        if (!requirementsTraceabilityMatrixInstance.save(flush: true)) {
            render(view: "edit", model: [requirementsTraceabilityMatrixInstance: requirementsTraceabilityMatrixInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), requirementsTraceabilityMatrixInstance.id])
        redirect(action: "show", id: requirementsTraceabilityMatrixInstance.id)
    }

    def delete(Long id) {
        def requirementsTraceabilityMatrixInstance = RequirementsTraceabilityMatrix.get(id)
        if (!requirementsTraceabilityMatrixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), id])
            redirect(action: "list")
            return
        }

        try {
            requirementsTraceabilityMatrixInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix'), id])
            redirect(action: "show", id: id)
        }
    }
}
