package ProjectTimeManagement.Utility

import org.springframework.dao.DataIntegrityViolationException

class PixController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pixInstanceList: Pix.list(params), pixInstanceTotal: Pix.count()]
    }

    def create() {
        [pixInstance: new Pix(params)]
    }

    def save() {
        def pixInstance = new Pix(params)
        if (!pixInstance.save(flush: true)) {
            render(view: "create", model: [pixInstance: pixInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pix.label', default: 'Pix'), pixInstance.id])
        redirect(action: "show", id: pixInstance.id)
    }

    def show(Long id) {
        def pixInstance = Pix.get(id)
        if (!pixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pix.label', default: 'Pix'), id])
            redirect(action: "list")
            return
        }

        [pixInstance: pixInstance]
    }

    def edit(Long id) {
        def pixInstance = Pix.get(id)
        if (!pixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pix.label', default: 'Pix'), id])
            redirect(action: "list")
            return
        }

        [pixInstance: pixInstance]
    }

    def update(Long id, Long version) {
        def pixInstance = Pix.get(id)
        if (!pixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pix.label', default: 'Pix'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pixInstance.version > version) {
                pixInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pix.label', default: 'Pix')] as Object[],
                          "Another user has updated this Pix while you were editing")
                render(view: "edit", model: [pixInstance: pixInstance])
                return
            }
        }

        pixInstance.properties = params

        if (!pixInstance.save(flush: true)) {
            render(view: "edit", model: [pixInstance: pixInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pix.label', default: 'Pix'), pixInstance.id])
        redirect(action: "show", id: pixInstance.id)
    }

    def delete(Long id) {
        def pixInstance = Pix.get(id)
        if (!pixInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pix.label', default: 'Pix'), id])
            redirect(action: "list")
            return
        }

        try {
            pixInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pix.label', default: 'Pix'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pix.label', default: 'Pix'), id])
            redirect(action: "show", id: id)
        }
    }
}
