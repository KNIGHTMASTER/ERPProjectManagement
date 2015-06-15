package ProjectTimeManagement.Utility

import org.springframework.dao.DataIntegrityViolationException

class ActivityChangeRequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityChangeRequestInstanceList: ActivityChangeRequest.list(params), activityChangeRequestInstanceTotal: ActivityChangeRequest.count()]
    }

    def create() {
        [activityChangeRequestInstance: new ActivityChangeRequest(params)]
    }

    def save() {
        def activityChangeRequestInstance = new ActivityChangeRequest(params)
        if (!activityChangeRequestInstance.save(flush: true)) {
            render(view: "create", model: [activityChangeRequestInstance: activityChangeRequestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), activityChangeRequestInstance.id])
        redirect(action: "show", id: activityChangeRequestInstance.id)
    }

    def show(Long id) {
        def activityChangeRequestInstance = ActivityChangeRequest.get(id)
        if (!activityChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), id])
            redirect(action: "list")
            return
        }

        [activityChangeRequestInstance: activityChangeRequestInstance]
    }

    def edit(Long id) {
        def activityChangeRequestInstance = ActivityChangeRequest.get(id)
        if (!activityChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), id])
            redirect(action: "list")
            return
        }

        [activityChangeRequestInstance: activityChangeRequestInstance]
    }

    def update(Long id, Long version) {
        def activityChangeRequestInstance = ActivityChangeRequest.get(id)
        if (!activityChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityChangeRequestInstance.version > version) {
                activityChangeRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest')] as Object[],
                          "Another user has updated this ActivityChangeRequest while you were editing")
                render(view: "edit", model: [activityChangeRequestInstance: activityChangeRequestInstance])
                return
            }
        }

        activityChangeRequestInstance.properties = params

        if (!activityChangeRequestInstance.save(flush: true)) {
            render(view: "edit", model: [activityChangeRequestInstance: activityChangeRequestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), activityChangeRequestInstance.id])
        redirect(action: "show", id: activityChangeRequestInstance.id)
    }

    def delete(Long id) {
        def activityChangeRequestInstance = ActivityChangeRequest.get(id)
        if (!activityChangeRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), id])
            redirect(action: "list")
            return
        }

        try {
            activityChangeRequestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest'), id])
            redirect(action: "show", id: id)
        }
    }
}
