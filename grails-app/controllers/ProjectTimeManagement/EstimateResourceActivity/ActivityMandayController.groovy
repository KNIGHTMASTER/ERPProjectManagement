package ProjectTimeManagement.EstimateResourceActivity

import org.springframework.dao.DataIntegrityViolationException

class ActivityMandayController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityMandayInstanceList: ActivityManday.list(params), activityMandayInstanceTotal: ActivityManday.count()]
    }

    def create() {
        [activityMandayInstance: new ActivityManday(params)]
    }

    def save() {
        def activityMandayInstance = new ActivityManday(params)
        if (!activityMandayInstance.save(flush: true)) {
            render(view: "create", model: [activityMandayInstance: activityMandayInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), activityMandayInstance.id])
        redirect(action: "show", id: activityMandayInstance.id)
    }

    def show(Long id) {
        def activityMandayInstance = ActivityManday.get(id)
        if (!activityMandayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), id])
            redirect(action: "list")
            return
        }

        [activityMandayInstance: activityMandayInstance]
    }

    def edit(Long id) {
        def activityMandayInstance = ActivityManday.get(id)
        if (!activityMandayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), id])
            redirect(action: "list")
            return
        }

        [activityMandayInstance: activityMandayInstance]
    }

    def update(Long id, Long version) {
        def activityMandayInstance = ActivityManday.get(id)
        if (!activityMandayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityMandayInstance.version > version) {
                activityMandayInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityManday.label', default: 'ActivityManday')] as Object[],
                          "Another user has updated this ActivityManday while you were editing")
                render(view: "edit", model: [activityMandayInstance: activityMandayInstance])
                return
            }
        }

        activityMandayInstance.properties = params

        if (!activityMandayInstance.save(flush: true)) {
            render(view: "edit", model: [activityMandayInstance: activityMandayInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), activityMandayInstance.id])
        redirect(action: "show", id: activityMandayInstance.id)
    }

    def delete(Long id) {
        def activityMandayInstance = ActivityManday.get(id)
        if (!activityMandayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), id])
            redirect(action: "list")
            return
        }

        try {
            activityMandayInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityManday.label', default: 'ActivityManday'), id])
            redirect(action: "show", id: id)
        }
    }
}
