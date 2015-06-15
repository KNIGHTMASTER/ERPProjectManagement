package WebPage
import grails.plugins.springsecurity.Secured;
import org.springframework.dao.DataIntegrityViolationException

class PCostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [PCostInstanceList: PCost.list(params), PCostInstanceTotal: PCost.count()]
    }

    def create() {
        [PCostInstance: new PCost(params)]
    }

    def save() {
        def PCostInstance = new PCost(params)
        if (!PCostInstance.save(flush: true)) {
            render(view: "create", model: [PCostInstance: PCostInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'PCost.label', default: 'PCost'), PCostInstance.id])
        redirect(action: "show", id: PCostInstance.id)
    }

    def show(Long id) {
        def PCostInstance = PCost.get(id)
        if (!PCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PCost.label', default: 'PCost'), id])
            redirect(action: "list")
            return
        }

        [PCostInstance: PCostInstance]
    }

    def edit(Long id) {
        def PCostInstance = PCost.get(id)
        if (!PCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PCost.label', default: 'PCost'), id])
            redirect(action: "list")
            return
        }

        [PCostInstance: PCostInstance]
    }

    def update(Long id, Long version) {
        def PCostInstance = PCost.get(id)
        if (!PCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PCost.label', default: 'PCost'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (PCostInstance.version > version) {
                PCostInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'PCost.label', default: 'PCost')] as Object[],
                          "Another user has updated this PCost while you were editing")
                render(view: "edit", model: [PCostInstance: PCostInstance])
                return
            }
        }

        PCostInstance.properties = params

        if (!PCostInstance.save(flush: true)) {
            render(view: "edit", model: [PCostInstance: PCostInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'PCost.label', default: 'PCost'), PCostInstance.id])
        redirect(action: "show", id: PCostInstance.id)
    }

    def delete(Long id) {
        def PCostInstance = PCost.get(id)
        if (!PCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'PCost.label', default: 'PCost'), id])
            redirect(action: "list")
            return
        }

        try {
            PCostInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'PCost.label', default: 'PCost'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'PCost.label', default: 'PCost'), id])
            redirect(action: "show", id: id)
        }
    }
}
