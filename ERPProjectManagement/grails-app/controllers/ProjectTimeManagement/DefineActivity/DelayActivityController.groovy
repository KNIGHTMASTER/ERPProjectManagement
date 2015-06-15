package ProjectTimeManagement.DefineActivity

import org.springframework.dao.DataIntegrityViolationException

class DelayActivityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [delayActivityInstanceList: DelayActivity.list(params), delayActivityInstanceTotal: DelayActivity.count()]
    }

    def create() {
        [delayActivityInstance: new DelayActivity(params)]
    }

    def save() {
        def delayActivityInstance = new DelayActivity(params)
        if (!delayActivityInstance.save(flush: true)) {
            render(view: "create", model: [delayActivityInstance: delayActivityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), delayActivityInstance.id])
        redirect(action: "show", id: delayActivityInstance.id)
    }

    def show(Long id) {
        def delayActivityInstance = DelayActivity.get(id)
        if (!delayActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), id])
            redirect(action: "list")
            return
        }

        [delayActivityInstance: delayActivityInstance]
    }

    def edit(Long id) {
        def delayActivityInstance = DelayActivity.get(id)
        if (!delayActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), id])
            redirect(action: "list")
            return
        }

        [delayActivityInstance: delayActivityInstance]
    }

    def update(Long id, Long version) {
        def delayActivityInstance = DelayActivity.get(id)
        if (!delayActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (delayActivityInstance.version > version) {
                delayActivityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'delayActivity.label', default: 'DelayActivity')] as Object[],
                          "Another user has updated this DelayActivity while you were editing")
                render(view: "edit", model: [delayActivityInstance: delayActivityInstance])
                return
            }
        }

        delayActivityInstance.properties = params

        if (!delayActivityInstance.save(flush: true)) {
            render(view: "edit", model: [delayActivityInstance: delayActivityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), delayActivityInstance.id])
        redirect(action: "show", id: delayActivityInstance.id)
    }

    def delete(Long id) {
        def delayActivityInstance = DelayActivity.get(id)
        if (!delayActivityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), id])
            redirect(action: "list")
            return
        }

        try {
            delayActivityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'delayActivity.label', default: 'DelayActivity'), id])
            redirect(action: "show", id: id)
        }
    }
}
