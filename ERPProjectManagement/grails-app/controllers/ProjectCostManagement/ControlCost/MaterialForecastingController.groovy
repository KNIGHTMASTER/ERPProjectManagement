package ProjectCostManagement.ControlCost

import org.springframework.dao.DataIntegrityViolationException

class MaterialForecastingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materialForecastingInstanceList: MaterialForecasting.list(params), materialForecastingInstanceTotal: MaterialForecasting.count()]
    }

    def create() {
        [materialForecastingInstance: new MaterialForecasting(params)]
    }

    def save() {
        def materialForecastingInstance = new MaterialForecasting(params)
        if (!materialForecastingInstance.save(flush: true)) {
            render(view: "create", model: [materialForecastingInstance: materialForecastingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), materialForecastingInstance.id])
        redirect(action: "show", id: materialForecastingInstance.id)
    }

    def show(Long id) {
        def materialForecastingInstance = MaterialForecasting.get(id)
        if (!materialForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), id])
            redirect(action: "list")
            return
        }

        [materialForecastingInstance: materialForecastingInstance]
    }

    def edit(Long id) {
        def materialForecastingInstance = MaterialForecasting.get(id)
        if (!materialForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), id])
            redirect(action: "list")
            return
        }

        [materialForecastingInstance: materialForecastingInstance]
    }

    def update(Long id, Long version) {
        def materialForecastingInstance = MaterialForecasting.get(id)
        if (!materialForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materialForecastingInstance.version > version) {
                materialForecastingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materialForecasting.label', default: 'MaterialForecasting')] as Object[],
                          "Another user has updated this MaterialForecasting while you were editing")
                render(view: "edit", model: [materialForecastingInstance: materialForecastingInstance])
                return
            }
        }

        materialForecastingInstance.properties = params

        if (!materialForecastingInstance.save(flush: true)) {
            render(view: "edit", model: [materialForecastingInstance: materialForecastingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), materialForecastingInstance.id])
        redirect(action: "show", id: materialForecastingInstance.id)
    }

    def delete(Long id) {
        def materialForecastingInstance = MaterialForecasting.get(id)
        if (!materialForecastingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), id])
            redirect(action: "list")
            return
        }

        try {
            materialForecastingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materialForecasting.label', default: 'MaterialForecasting'), id])
            redirect(action: "show", id: id)
        }
    }
}
