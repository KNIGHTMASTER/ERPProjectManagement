package ProjectCostManagement.ControlCost

import org.springframework.dao.DataIntegrityViolationException

class HumanForecastingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [humanForecastingInstanceList: HumanForecasting.list(params), humanForecastingInstanceTotal: HumanForecasting.count()]
    }

    def create() {
        [humanForecastingInstance: new HumanForecasting(params)]
    }

    def save() {
        def humanForecastingInstance = new HumanForecasting(params)
        if (!humanForecastingInstance.save(flush: true)) {
            render(view: "create", model: [humanForecastingInstance: humanForecastingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), humanForecastingInstance.id])
        redirect(action: "show", id: humanForecastingInstance.id)
    }

    def show(Long id) {
        def humanForecastingInstance = HumanForecasting.get(id)
        if (!humanForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), id])
            redirect(action: "list")
            return
        }

        [humanForecastingInstance: humanForecastingInstance]
    }

    def edit(Long id) {
        def humanForecastingInstance = HumanForecasting.get(id)
        if (!humanForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), id])
            redirect(action: "list")
            return
        }

        [humanForecastingInstance: humanForecastingInstance]
    }

    def update(Long id, Long version) {
        def humanForecastingInstance = HumanForecasting.get(id)
        if (!humanForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (humanForecastingInstance.version > version) {
                humanForecastingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'humanForecasting.label', default: 'HumanForecasting')] as Object[],
                          "Another user has updated this HumanForecasting while you were editing")
                render(view: "edit", model: [humanForecastingInstance: humanForecastingInstance])
                return
            }
        }

        humanForecastingInstance.properties = params

        if (!humanForecastingInstance.save(flush: true)) {
            render(view: "edit", model: [humanForecastingInstance: humanForecastingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), humanForecastingInstance.id])
        redirect(action: "show", id: humanForecastingInstance.id)
    }

    def delete(Long id) {
        def humanForecastingInstance = HumanForecasting.get(id)
        if (!humanForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), id])
            redirect(action: "list")
            return
        }

        try {
            humanForecastingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'humanForecasting.label', default: 'HumanForecasting'), id])
            redirect(action: "show", id: id)
        }
    }
}
