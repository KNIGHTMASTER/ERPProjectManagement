package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class ActivityCostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityCostInstanceList: ActivityCost.list(params), activityCostInstanceTotal: ActivityCost.count()]
    }

    def create() {
        [activityCostInstance: new ActivityCost(params)]
    }

    def save() {
        def activityCostInstance = new ActivityCost(params)
        if (!activityCostInstance.save(flush: true)) {
            render(view: "create", model: [activityCostInstance: activityCostInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), activityCostInstance.id])
        redirect(action: "show", id: activityCostInstance.id)
    }

    def show(Long id) {
        def activityCostInstance = ActivityCost.get(id)
        if (!activityCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), id])
            redirect(action: "list")
            return
        }

        [activityCostInstance: activityCostInstance]
    }

    def edit(Long id) {
        def activityCostInstance = ActivityCost.get(id)
        if (!activityCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), id])
            redirect(action: "list")
            return
        }

        [activityCostInstance: activityCostInstance]
    }

    def update(Long id, Long version) {
        def activityCostInstance = ActivityCost.get(id)
        if (!activityCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityCostInstance.version > version) {
                activityCostInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityCost.label', default: 'ActivityCost')] as Object[],
                          "Another user has updated this ActivityCost while you were editing")
                render(view: "edit", model: [activityCostInstance: activityCostInstance])
                return
            }
        }

        activityCostInstance.properties = params

        if (!activityCostInstance.save(flush: true)) {
            render(view: "edit", model: [activityCostInstance: activityCostInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), activityCostInstance.id])
        redirect(action: "show", id: activityCostInstance.id)
    }

    def delete(Long id) {
        def activityCostInstance = ActivityCost.get(id)
        if (!activityCostInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), id])
            redirect(action: "list")
            return
        }

        try {
            activityCostInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityCost.label', default: 'ActivityCost'), id])
            redirect(action: "show", id: id)
        }
    }
}
