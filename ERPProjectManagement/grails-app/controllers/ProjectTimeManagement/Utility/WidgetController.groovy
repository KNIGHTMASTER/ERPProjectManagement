package ProjectTimeManagement.Utility

import org.springframework.dao.DataIntegrityViolationException

class WidgetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [widgetInstanceList: Widget.list(params), widgetInstanceTotal: Widget.count()]
    }

    def create() {
        [widgetInstance: new Widget(params)]
    }

    def save() {
        def widgetInstance = new Widget(params)
        if (!widgetInstance.save(flush: true)) {
            render(view: "create", model: [widgetInstance: widgetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'widget.label', default: 'Widget'), widgetInstance.id])
        redirect(action: "show", id: widgetInstance.id)
    }

    def show(Long id) {
        def widgetInstance = Widget.get(id)
        if (!widgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'widget.label', default: 'Widget'), id])
            redirect(action: "list")
            return
        }

        [widgetInstance: widgetInstance]
    }

    def edit(Long id) {
        def widgetInstance = Widget.get(id)
        if (!widgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'widget.label', default: 'Widget'), id])
            redirect(action: "list")
            return
        }

        [widgetInstance: widgetInstance]
    }

    def update(Long id, Long version) {
        def widgetInstance = Widget.get(id)
        if (!widgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'widget.label', default: 'Widget'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (widgetInstance.version > version) {
                widgetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'widget.label', default: 'Widget')] as Object[],
                          "Another user has updated this Widget while you were editing")
                render(view: "edit", model: [widgetInstance: widgetInstance])
                return
            }
        }

        widgetInstance.properties = params

        if (!widgetInstance.save(flush: true)) {
            render(view: "edit", model: [widgetInstance: widgetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'widget.label', default: 'Widget'), widgetInstance.id])
        redirect(action: "show", id: widgetInstance.id)
    }

    def delete(Long id) {
        def widgetInstance = Widget.get(id)
        if (!widgetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'widget.label', default: 'Widget'), id])
            redirect(action: "list")
            return
        }

        try {
            widgetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'widget.label', default: 'Widget'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'widget.label', default: 'Widget'), id])
            redirect(action: "show", id: id)
        }
    }
}
