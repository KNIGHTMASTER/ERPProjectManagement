package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationProjectScopeStatementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationProjectScopeStatementInstanceList: IdentificationProjectScopeStatement.list(params), identificationProjectScopeStatementInstanceTotal: IdentificationProjectScopeStatement.count()]
    }

    def create() {
        [identificationProjectScopeStatementInstance: new IdentificationProjectScopeStatement(params)]
    }

    def save() {
        def identificationProjectScopeStatementInstance = new IdentificationProjectScopeStatement(params)
        if (!identificationProjectScopeStatementInstance.save(flush: true)) {
            render(view: "create", model: [identificationProjectScopeStatementInstance: identificationProjectScopeStatementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), identificationProjectScopeStatementInstance.id])
        redirect(action: "show", id: identificationProjectScopeStatementInstance.id)
    }

    def show(Long id) {
        def identificationProjectScopeStatementInstance = IdentificationProjectScopeStatement.get(id)
        if (!identificationProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        [identificationProjectScopeStatementInstance: identificationProjectScopeStatementInstance]
    }

    def edit(Long id) {
        def identificationProjectScopeStatementInstance = IdentificationProjectScopeStatement.get(id)
        if (!identificationProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        [identificationProjectScopeStatementInstance: identificationProjectScopeStatementInstance]
    }

    def update(Long id, Long version) {
        def identificationProjectScopeStatementInstance = IdentificationProjectScopeStatement.get(id)
        if (!identificationProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationProjectScopeStatementInstance.version > version) {
                identificationProjectScopeStatementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement')] as Object[],
                          "Another user has updated this IdentificationProjectScopeStatement while you were editing")
                render(view: "edit", model: [identificationProjectScopeStatementInstance: identificationProjectScopeStatementInstance])
                return
            }
        }

        identificationProjectScopeStatementInstance.properties = params

        if (!identificationProjectScopeStatementInstance.save(flush: true)) {
            render(view: "edit", model: [identificationProjectScopeStatementInstance: identificationProjectScopeStatementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), identificationProjectScopeStatementInstance.id])
        redirect(action: "show", id: identificationProjectScopeStatementInstance.id)
    }

    def delete(Long id) {
        def identificationProjectScopeStatementInstance = IdentificationProjectScopeStatement.get(id)
        if (!identificationProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationProjectScopeStatementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement'), id])
            redirect(action: "show", id: id)
        }
    }
}
