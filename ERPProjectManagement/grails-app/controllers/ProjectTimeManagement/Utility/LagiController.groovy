package ProjectTimeManagement.Utility

import org.springframework.dao.DataIntegrityViolationException

class LagiController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lagiInstanceList: Lagi.list(params), lagiInstanceTotal: Lagi.count()]
    }

    def create() {
        [lagiInstance: new Lagi(params)]
    }

    def save() {
        def lagiInstance = new Lagi(params)
        if (!lagiInstance.save(flush: true)) {
            render(view: "create", model: [lagiInstance: lagiInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'lagi.label', default: 'Lagi'), lagiInstance.id])
        redirect(action: "show", id: lagiInstance.id)
    }

    def show(Long id) {
        def lagiInstance = Lagi.get(id)
        if (!lagiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lagi.label', default: 'Lagi'), id])
            redirect(action: "list")
            return
        }

        [lagiInstance: lagiInstance]
    }

    def edit(Long id) {
        def lagiInstance = Lagi.get(id)
        if (!lagiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lagi.label', default: 'Lagi'), id])
            redirect(action: "list")
            return
        }

        [lagiInstance: lagiInstance]
    }

    def update(Long id, Long version) {
        def lagiInstance = Lagi.get(id)
        if (!lagiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lagi.label', default: 'Lagi'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lagiInstance.version > version) {
                lagiInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lagi.label', default: 'Lagi')] as Object[],
                          "Another user has updated this Lagi while you were editing")
                render(view: "edit", model: [lagiInstance: lagiInstance])
                return
            }
        }

        lagiInstance.properties = params

        if (!lagiInstance.save(flush: true)) {
            render(view: "edit", model: [lagiInstance: lagiInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'lagi.label', default: 'Lagi'), lagiInstance.id])
        redirect(action: "show", id: lagiInstance.id)
    }

    def delete(Long id) {
        def lagiInstance = Lagi.get(id)
        if (!lagiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lagi.label', default: 'Lagi'), id])
            redirect(action: "list")
            return
        }

        try {
            lagiInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lagi.label', default: 'Lagi'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lagi.label', default: 'Lagi'), id])
            redirect(action: "show", id: id)
        }
    }
}
