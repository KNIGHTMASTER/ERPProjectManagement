package ProjectTimeManagement.Utility

import org.springframework.dao.DataIntegrityViolationException

class CobaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cobaInstanceList: Coba.list(params), cobaInstanceTotal: Coba.count()]
    }

    def create() {
        [cobaInstance: new Coba(params)]
    }

    def save() {
        def cobaInstance = new Coba(params)
        if (!cobaInstance.save(flush: true)) {
            render(view: "create", model: [cobaInstance: cobaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'coba.label', default: 'Coba'), cobaInstance.id])
        redirect(action: "show", id: cobaInstance.id)
    }

    def show(Long id) {
        def cobaInstance = Coba.get(id)
        if (!cobaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coba.label', default: 'Coba'), id])
            redirect(action: "list")
            return
        }

        [cobaInstance: cobaInstance]
    }

    def edit(Long id) {
        def cobaInstance = Coba.get(id)
        if (!cobaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coba.label', default: 'Coba'), id])
            redirect(action: "list")
            return
        }

        [cobaInstance: cobaInstance]
    }

    def update(Long id, Long version) {
        def cobaInstance = Coba.get(id)
        if (!cobaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coba.label', default: 'Coba'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cobaInstance.version > version) {
                cobaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'coba.label', default: 'Coba')] as Object[],
                          "Another user has updated this Coba while you were editing")
                render(view: "edit", model: [cobaInstance: cobaInstance])
                return
            }
        }

        cobaInstance.properties = params

        if (!cobaInstance.save(flush: true)) {
            render(view: "edit", model: [cobaInstance: cobaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'coba.label', default: 'Coba'), cobaInstance.id])
        redirect(action: "show", id: cobaInstance.id)
    }

    def delete(Long id) {
        def cobaInstance = Coba.get(id)
        if (!cobaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coba.label', default: 'Coba'), id])
            redirect(action: "list")
            return
        }

        try {
            cobaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'coba.label', default: 'Coba'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'coba.label', default: 'Coba'), id])
            redirect(action: "show", id: id)
        }
    }
}
