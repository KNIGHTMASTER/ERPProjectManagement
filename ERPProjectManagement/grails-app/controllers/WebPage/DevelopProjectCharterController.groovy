package WebPage

import org.springframework.dao.DataIntegrityViolationException

class DevelopProjectCharterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [developProjectCharterInstanceList: DevelopProjectCharter.list(params), developProjectCharterInstanceTotal: DevelopProjectCharter.count()]
    }

    def create() {
        [developProjectCharterInstance: new DevelopProjectCharter(params)]
    }

    def save() {
        def developProjectCharterInstance = new DevelopProjectCharter(params)
        if (!developProjectCharterInstance.save(flush: true)) {
            render(view: "create", model: [developProjectCharterInstance: developProjectCharterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), developProjectCharterInstance.id])
        redirect(action: "show", id: developProjectCharterInstance.id)
    }

    def show(Long id) {
        def developProjectCharterInstance = DevelopProjectCharter.get(id)
        if (!developProjectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), id])
            redirect(action: "list")
            return
        }

        [developProjectCharterInstance: developProjectCharterInstance]
    }

    def edit(Long id) {
        def developProjectCharterInstance = DevelopProjectCharter.get(id)
        if (!developProjectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), id])
            redirect(action: "list")
            return
        }

        [developProjectCharterInstance: developProjectCharterInstance]
    }

    def update(Long id, Long version) {
        def developProjectCharterInstance = DevelopProjectCharter.get(id)
        if (!developProjectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (developProjectCharterInstance.version > version) {
                developProjectCharterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter')] as Object[],
                          "Another user has updated this DevelopProjectCharter while you were editing")
                render(view: "edit", model: [developProjectCharterInstance: developProjectCharterInstance])
                return
            }
        }

        developProjectCharterInstance.properties = params

        if (!developProjectCharterInstance.save(flush: true)) {
            render(view: "edit", model: [developProjectCharterInstance: developProjectCharterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), developProjectCharterInstance.id])
        redirect(action: "show", id: developProjectCharterInstance.id)
    }

    def delete(Long id) {
        def developProjectCharterInstance = DevelopProjectCharter.get(id)
        if (!developProjectCharterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), id])
            redirect(action: "list")
            return
        }

        try {
            developProjectCharterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'developProjectCharter.label', default: 'DevelopProjectCharter'), id])
            redirect(action: "show", id: id)
        }
    }
}
