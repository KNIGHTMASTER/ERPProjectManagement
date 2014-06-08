package ProjectScopeManagement.CreateWBS

import org.springframework.dao.DataIntegrityViolationException

class WbsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wbsInstanceList: Wbs.list(params), wbsInstanceTotal: Wbs.count()]
    }

    def create() {
        [wbsInstance: new Wbs(params)]
    }

    def save() {
        def wbsInstance = new Wbs(params)
        if (!wbsInstance.save(flush: true)) {
            render(view: "create", model: [wbsInstance: wbsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wbs.label', default: 'Wbs'), wbsInstance.id])
        redirect(action: "show", id: wbsInstance.id)
    }

    def show(Long id) {
        def wbsInstance = Wbs.get(id)
        if (!wbsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbs.label', default: 'Wbs'), id])
            redirect(action: "list")
            return
        }

        [wbsInstance: wbsInstance]
    }

    def edit(Long id) {
        def wbsInstance = Wbs.get(id)
        if (!wbsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbs.label', default: 'Wbs'), id])
            redirect(action: "list")
            return
        }

        [wbsInstance: wbsInstance]
    }

    def update(Long id, Long version) {
        def wbsInstance = Wbs.get(id)
        if (!wbsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbs.label', default: 'Wbs'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wbsInstance.version > version) {
                wbsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wbs.label', default: 'Wbs')] as Object[],
                          "Another user has updated this Wbs while you were editing")
                render(view: "edit", model: [wbsInstance: wbsInstance])
                return
            }
        }

        wbsInstance.properties = params

        if (!wbsInstance.save(flush: true)) {
            render(view: "edit", model: [wbsInstance: wbsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wbs.label', default: 'Wbs'), wbsInstance.id])
        redirect(action: "show", id: wbsInstance.id)
    }

    def delete(Long id) {
        def wbsInstance = Wbs.get(id)
        if (!wbsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbs.label', default: 'Wbs'), id])
            redirect(action: "list")
            return
        }

        try {
            wbsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wbs.label', default: 'Wbs'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wbs.label', default: 'Wbs'), id])
            redirect(action: "show", id: id)
        }
    }
}
