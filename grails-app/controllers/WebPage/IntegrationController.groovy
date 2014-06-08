package WebPage

import org.springframework.dao.DataIntegrityViolationException

import grails.plugins.springsecurity.Secured

class IntegrationController {

	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [integrationInstanceList: Integration.list(params), integrationInstanceTotal: Integration.count()]
    }

    def create() {
        [integrationInstance: new Integration(params)]
    }

    def save() {
        def integrationInstance = new Integration(params)
        if (!integrationInstance.save(flush: true)) {
            render(view: "create", model: [integrationInstance: integrationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'integration.label', default: 'Integration'), integrationInstance.id])
        redirect(action: "show", id: integrationInstance.id)
    }

    def show(Long id) {
        def integrationInstance = Integration.get(id)
        if (!integrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'integration.label', default: 'Integration'), id])
            redirect(action: "list")
            return
        }

        [integrationInstance: integrationInstance]
    }

    def edit(Long id) {
        def integrationInstance = Integration.get(id)
        if (!integrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'integration.label', default: 'Integration'), id])
            redirect(action: "list")
            return
        }

        [integrationInstance: integrationInstance]
    }

    def update(Long id, Long version) {
        def integrationInstance = Integration.get(id)
        if (!integrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'integration.label', default: 'Integration'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (integrationInstance.version > version) {
                integrationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'integration.label', default: 'Integration')] as Object[],
                          "Another user has updated this Integration while you were editing")
                render(view: "edit", model: [integrationInstance: integrationInstance])
                return
            }
        }

        integrationInstance.properties = params

        if (!integrationInstance.save(flush: true)) {
            render(view: "edit", model: [integrationInstance: integrationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'integration.label', default: 'Integration'), integrationInstance.id])
        redirect(action: "show", id: integrationInstance.id)
    }

    def delete(Long id) {
        def integrationInstance = Integration.get(id)
        if (!integrationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'integration.label', default: 'Integration'), id])
            redirect(action: "list")
            return
        }

        try {
            integrationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'integration.label', default: 'Integration'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'integration.label', default: 'Integration'), id])
            redirect(action: "show", id: id)
        }
    }
}
