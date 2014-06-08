package WebPage
import grails.plugins.springsecurity.Secured;
import org.springframework.dao.DataIntegrityViolationException

class ScopeManagementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ScopeManagement'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [scopeManagementInstanceList: ScopeManagement.list(params), scopeManagementInstanceTotal: ScopeManagement.count()]
    }

    def create() {
        [scopeManagementInstance: new ScopeManagement(params)]
    }

    def save() {
        def scopeManagementInstance = new ScopeManagement(params)
        if (!scopeManagementInstance.save(flush: true)) {
            render(view: "create", model: [scopeManagementInstance: scopeManagementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), scopeManagementInstance.id])
        redirect(action: "show", id: scopeManagementInstance.id)
    }

    def show(Long id) {
        def scopeManagementInstance = ScopeManagement.get(id)
        if (!scopeManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), id])
            redirect(action: "list")
            return
        }

        [scopeManagementInstance: scopeManagementInstance]
    }

    def edit(Long id) {
        def scopeManagementInstance = ScopeManagement.get(id)
        if (!scopeManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), id])
            redirect(action: "list")
            return
        }

        [scopeManagementInstance: scopeManagementInstance]
    }

    def update(Long id, Long version) {
        def scopeManagementInstance = ScopeManagement.get(id)
        if (!scopeManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (scopeManagementInstance.version > version) {
                scopeManagementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'scopeManagement.label', default: 'ScopeManagement')] as Object[],
                          "Another user has updated this ScopeManagement while you were editing")
                render(view: "edit", model: [scopeManagementInstance: scopeManagementInstance])
                return
            }
        }

        scopeManagementInstance.properties = params

        if (!scopeManagementInstance.save(flush: true)) {
            render(view: "edit", model: [scopeManagementInstance: scopeManagementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), scopeManagementInstance.id])
        redirect(action: "show", id: scopeManagementInstance.id)
    }

    def delete(Long id) {
        def scopeManagementInstance = ScopeManagement.get(id)
        if (!scopeManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), id])
            redirect(action: "list")
            return
        }

        try {
            scopeManagementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'scopeManagement.label', default: 'ScopeManagement'), id])
            redirect(action: "show", id: id)
        }
    }
}
