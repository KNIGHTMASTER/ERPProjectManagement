package ProjectScopeManagement.CollectRequirements

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class RequirementsDocumentationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=RequirementsDocumentation'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requirementsDocumentationInstanceList: RequirementsDocumentation.list(params), requirementsDocumentationInstanceTotal: RequirementsDocumentation.count()]
    }

    def create() {
        [requirementsDocumentationInstance: new RequirementsDocumentation(params)]
    }

    def save() {
        def requirementsDocumentationInstance = new RequirementsDocumentation(params)
        if (!requirementsDocumentationInstance.save(flush: true)) {
            render(view: "create", model: [requirementsDocumentationInstance: requirementsDocumentationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), requirementsDocumentationInstance.id])
        redirect(action: "show", id: requirementsDocumentationInstance.id)
    }

    def show(Long id) {
        def requirementsDocumentationInstance = RequirementsDocumentation.get(id)
        if (!requirementsDocumentationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), id])
            redirect(action: "list")
            return
        }

        [requirementsDocumentationInstance: requirementsDocumentationInstance]
    }

    def edit(Long id) {
        def requirementsDocumentationInstance = RequirementsDocumentation.get(id)
        if (!requirementsDocumentationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), id])
            redirect(action: "list")
            return
        }

        [requirementsDocumentationInstance: requirementsDocumentationInstance]
    }

    def update(Long id, Long version) {
        def requirementsDocumentationInstance = RequirementsDocumentation.get(id)
        if (!requirementsDocumentationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requirementsDocumentationInstance.version > version) {
                requirementsDocumentationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation')] as Object[],
                          "Another user has updated this RequirementsDocumentation while you were editing")
                render(view: "edit", model: [requirementsDocumentationInstance: requirementsDocumentationInstance])
                return
            }
        }

        requirementsDocumentationInstance.properties = params

        if (!requirementsDocumentationInstance.save(flush: true)) {
            render(view: "edit", model: [requirementsDocumentationInstance: requirementsDocumentationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), requirementsDocumentationInstance.id])
        redirect(action: "show", id: requirementsDocumentationInstance.id)
    }

    def delete(Long id) {
        def requirementsDocumentationInstance = RequirementsDocumentation.get(id)
        if (!requirementsDocumentationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), id])
            redirect(action: "list")
            return
        }

        try {
            requirementsDocumentationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation'), id])
            redirect(action: "show", id: id)
        }
    }
}
