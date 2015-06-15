package ProjectCostManagement.EstimateCost

import org.springframework.dao.DataIntegrityViolationException

class ActivityCostEstimatesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityCostEstimatesInstanceList: ActivityCostEstimates.list(params), activityCostEstimatesInstanceTotal: ActivityCostEstimates.count()]
    }

    def create() {
        [activityCostEstimatesInstance: new ActivityCostEstimates(params)]
    }

    def save() {
        def activityCostEstimatesInstance = new ActivityCostEstimates(params)
        if (!activityCostEstimatesInstance.save(flush: true)) {
            render(view: "create", model: [activityCostEstimatesInstance: activityCostEstimatesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), activityCostEstimatesInstance.id])
        redirect(action: "show", id: activityCostEstimatesInstance.id)
    }

    def show(Long id) {
        def activityCostEstimatesInstance = ActivityCostEstimates.get(id)
        if (!activityCostEstimatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), id])
            redirect(action: "list")
            return
        }

        [activityCostEstimatesInstance: activityCostEstimatesInstance]
    }

    def edit(Long id) {
        def activityCostEstimatesInstance = ActivityCostEstimates.get(id)
        if (!activityCostEstimatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), id])
            redirect(action: "list")
            return
        }

        [activityCostEstimatesInstance: activityCostEstimatesInstance]
    }

    def update(Long id, Long version) {
        def activityCostEstimatesInstance = ActivityCostEstimates.get(id)
        if (!activityCostEstimatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityCostEstimatesInstance.version > version) {
                activityCostEstimatesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates')] as Object[],
                          "Another user has updated this ActivityCostEstimates while you were editing")
                render(view: "edit", model: [activityCostEstimatesInstance: activityCostEstimatesInstance])
                return
            }
        }

        activityCostEstimatesInstance.properties = params

        if (!activityCostEstimatesInstance.save(flush: true)) {
            render(view: "edit", model: [activityCostEstimatesInstance: activityCostEstimatesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), activityCostEstimatesInstance.id])
        redirect(action: "show", id: activityCostEstimatesInstance.id)
    }

    def delete(Long id) {
        def activityCostEstimatesInstance = ActivityCostEstimates.get(id)
        if (!activityCostEstimatesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), id])
            redirect(action: "list")
            return
        }

        try {
            activityCostEstimatesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates'), id])
            redirect(action: "show", id: id)
        }
    }
}
