package ProjectCostManagement.EstimateCost

import org.springframework.dao.DataIntegrityViolationException

class BasicOfEstimateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [basicOfEstimateInstanceList: BasicOfEstimate.list(params), basicOfEstimateInstanceTotal: BasicOfEstimate.count()]
    }

    def create() {
        [basicOfEstimateInstance: new BasicOfEstimate(params)]
    }

    def save() {
        def basicOfEstimateInstance = new BasicOfEstimate(params)
        if (!basicOfEstimateInstance.save(flush: true)) {
            render(view: "create", model: [basicOfEstimateInstance: basicOfEstimateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), basicOfEstimateInstance.id])
        redirect(action: "show", id: basicOfEstimateInstance.id)
    }

    def show(Long id) {
        def basicOfEstimateInstance = BasicOfEstimate.get(id)
        if (!basicOfEstimateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), id])
            redirect(action: "list")
            return
        }

        [basicOfEstimateInstance: basicOfEstimateInstance]
    }

    def edit(Long id) {
        def basicOfEstimateInstance = BasicOfEstimate.get(id)
        if (!basicOfEstimateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), id])
            redirect(action: "list")
            return
        }

        [basicOfEstimateInstance: basicOfEstimateInstance]
    }

    def update(Long id, Long version) {
        def basicOfEstimateInstance = BasicOfEstimate.get(id)
        if (!basicOfEstimateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (basicOfEstimateInstance.version > version) {
                basicOfEstimateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate')] as Object[],
                          "Another user has updated this BasicOfEstimate while you were editing")
                render(view: "edit", model: [basicOfEstimateInstance: basicOfEstimateInstance])
                return
            }
        }

        basicOfEstimateInstance.properties = params

        if (!basicOfEstimateInstance.save(flush: true)) {
            render(view: "edit", model: [basicOfEstimateInstance: basicOfEstimateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), basicOfEstimateInstance.id])
        redirect(action: "show", id: basicOfEstimateInstance.id)
    }

    def delete(Long id) {
        def basicOfEstimateInstance = BasicOfEstimate.get(id)
        if (!basicOfEstimateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), id])
            redirect(action: "list")
            return
        }

        try {
            basicOfEstimateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate'), id])
            redirect(action: "show", id: id)
        }
    }
}
