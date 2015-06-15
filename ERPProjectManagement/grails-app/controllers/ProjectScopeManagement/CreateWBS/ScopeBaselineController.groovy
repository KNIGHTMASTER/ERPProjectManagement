package ProjectScopeManagement.CreateWBS

import org.springframework.dao.DataIntegrityViolationException

class ScopeBaselineController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [scopeBaselineInstanceList: ScopeBaseline.list(params), scopeBaselineInstanceTotal: ScopeBaseline.count()]
    }

    def create() {
        [scopeBaselineInstance: new ScopeBaseline(params)]
    }

    def save() {
        def scopeBaselineInstance = new ScopeBaseline(params)
        if (!scopeBaselineInstance.save(flush: true)) {
            render(view: "create", model: [scopeBaselineInstance: scopeBaselineInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), scopeBaselineInstance.id])
        redirect(action: "show", id: scopeBaselineInstance.id)
    }

    def show(Long id) {
        def scopeBaselineInstance = ScopeBaseline.get(id)
        if (!scopeBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), id])
            redirect(action: "list")
            return
        }

        [scopeBaselineInstance: scopeBaselineInstance]
    }

    def edit(Long id) {
        def scopeBaselineInstance = ScopeBaseline.get(id)
        if (!scopeBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), id])
            redirect(action: "list")
            return
        }

        [scopeBaselineInstance: scopeBaselineInstance]
    }

    def update(Long id, Long version) {
        def scopeBaselineInstance = ScopeBaseline.get(id)
        if (!scopeBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (scopeBaselineInstance.version > version) {
                scopeBaselineInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'scopeBaseline.label', default: 'ScopeBaseline')] as Object[],
                          "Another user has updated this ScopeBaseline while you were editing")
                render(view: "edit", model: [scopeBaselineInstance: scopeBaselineInstance])
                return
            }
        }

        scopeBaselineInstance.properties = params

        if (!scopeBaselineInstance.save(flush: true)) {
            render(view: "edit", model: [scopeBaselineInstance: scopeBaselineInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), scopeBaselineInstance.id])
        redirect(action: "show", id: scopeBaselineInstance.id)
    }

    def delete(Long id) {
        def scopeBaselineInstance = ScopeBaseline.get(id)
        if (!scopeBaselineInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), id])
            redirect(action: "list")
            return
        }

        try {
            scopeBaselineInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'scopeBaseline.label', default: 'ScopeBaseline'), id])
            redirect(action: "show", id: id)
        }
    }
}
