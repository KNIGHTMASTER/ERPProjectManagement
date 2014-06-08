package ProjectScopeManagement.CreateWBS

import org.springframework.dao.DataIntegrityViolationException

class WbsDictionaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wbsDictionaryInstanceList: WbsDictionary.list(params), wbsDictionaryInstanceTotal: WbsDictionary.count()]
    }

    def create() {
        [wbsDictionaryInstance: new WbsDictionary(params)]
    }

    def save() {
        def wbsDictionaryInstance = new WbsDictionary(params)
        if (!wbsDictionaryInstance.save(flush: true)) {
            render(view: "create", model: [wbsDictionaryInstance: wbsDictionaryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), wbsDictionaryInstance.id])
        redirect(action: "show", id: wbsDictionaryInstance.id)
    }

    def show(Long id) {
        def wbsDictionaryInstance = WbsDictionary.get(id)
        if (!wbsDictionaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), id])
            redirect(action: "list")
            return
        }

        [wbsDictionaryInstance: wbsDictionaryInstance]
    }

    def edit(Long id) {
        def wbsDictionaryInstance = WbsDictionary.get(id)
        if (!wbsDictionaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), id])
            redirect(action: "list")
            return
        }

        [wbsDictionaryInstance: wbsDictionaryInstance]
    }

    def update(Long id, Long version) {
        def wbsDictionaryInstance = WbsDictionary.get(id)
        if (!wbsDictionaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wbsDictionaryInstance.version > version) {
                wbsDictionaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wbsDictionary.label', default: 'WbsDictionary')] as Object[],
                          "Another user has updated this WbsDictionary while you were editing")
                render(view: "edit", model: [wbsDictionaryInstance: wbsDictionaryInstance])
                return
            }
        }

        wbsDictionaryInstance.properties = params

        if (!wbsDictionaryInstance.save(flush: true)) {
            render(view: "edit", model: [wbsDictionaryInstance: wbsDictionaryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), wbsDictionaryInstance.id])
        redirect(action: "show", id: wbsDictionaryInstance.id)
    }

    def delete(Long id) {
        def wbsDictionaryInstance = WbsDictionary.get(id)
        if (!wbsDictionaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), id])
            redirect(action: "list")
            return
        }

        try {
            wbsDictionaryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wbsDictionary.label', default: 'WbsDictionary'), id])
            redirect(action: "show", id: id)
        }
    }
}
