package ProjectCostManagement.ControlCost

import org.springframework.dao.DataIntegrityViolationException

class ManagementForecastingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [managementForecastingInstanceList: ManagementForecasting.list(params), managementForecastingInstanceTotal: ManagementForecasting.count()]
    }

    def create() {
        [managementForecastingInstance: new ManagementForecasting(params)]
    }

    def save() {
        def managementForecastingInstance = new ManagementForecasting(params)
        if (!managementForecastingInstance.save(flush: true)) {
            render(view: "create", model: [managementForecastingInstance: managementForecastingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), managementForecastingInstance.id])
        redirect(action: "show", id: managementForecastingInstance.id)
    }

    def show(Long id) {
        def managementForecastingInstance = ManagementForecasting.get(id)
        if (!managementForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), id])
            redirect(action: "list")
            return
        }

        [managementForecastingInstance: managementForecastingInstance]
    }

    def edit(Long id) {
        def managementForecastingInstance = ManagementForecasting.get(id)
        if (!managementForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), id])
            redirect(action: "list")
            return
        }

        [managementForecastingInstance: managementForecastingInstance]
    }

    def update(Long id, Long version) {
        def managementForecastingInstance = ManagementForecasting.get(id)
        if (!managementForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (managementForecastingInstance.version > version) {
                managementForecastingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'managementForecasting.label', default: 'ManagementForecasting')] as Object[],
                          "Another user has updated this ManagementForecasting while you were editing")
                render(view: "edit", model: [managementForecastingInstance: managementForecastingInstance])
                return
            }
        }

        managementForecastingInstance.properties = params

        if (!managementForecastingInstance.save(flush: true)) {
            render(view: "edit", model: [managementForecastingInstance: managementForecastingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), managementForecastingInstance.id])
        redirect(action: "show", id: managementForecastingInstance.id)
    }

    def delete(Long id) {
        def managementForecastingInstance = ManagementForecasting.get(id)
        if (!managementForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), id])
            redirect(action: "list")
            return
        }

        try {
            managementForecastingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'managementForecasting.label', default: 'ManagementForecasting'), id])
            redirect(action: "show", id: id)
        }
    }
}
