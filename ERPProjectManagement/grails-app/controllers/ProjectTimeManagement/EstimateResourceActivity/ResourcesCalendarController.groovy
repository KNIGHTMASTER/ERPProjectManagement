package ProjectTimeManagement.EstimateResourceActivity

import org.springframework.dao.DataIntegrityViolationException

class ResourcesCalendarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [resourcesCalendarInstanceList: ResourcesCalendar.list(params), resourcesCalendarInstanceTotal: ResourcesCalendar.count()]
    }

    def create() {
        [resourcesCalendarInstance: new ResourcesCalendar(params)]
    }

    def save() {
        def resourcesCalendarInstance = new ResourcesCalendar(params)
        if (!resourcesCalendarInstance.save(flush: true)) {
            render(view: "create", model: [resourcesCalendarInstance: resourcesCalendarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), resourcesCalendarInstance.id])
        redirect(action: "show", id: resourcesCalendarInstance.id)
    }

    def show(Long id) {
        def resourcesCalendarInstance = ResourcesCalendar.get(id)
        if (!resourcesCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), id])
            redirect(action: "list")
            return
        }

        [resourcesCalendarInstance: resourcesCalendarInstance]
    }

    def edit(Long id) {
        def resourcesCalendarInstance = ResourcesCalendar.get(id)
        if (!resourcesCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), id])
            redirect(action: "list")
            return
        }

        [resourcesCalendarInstance: resourcesCalendarInstance]
    }

    def update(Long id, Long version) {
        def resourcesCalendarInstance = ResourcesCalendar.get(id)
        if (!resourcesCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (resourcesCalendarInstance.version > version) {
                resourcesCalendarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar')] as Object[],
                          "Another user has updated this ResourcesCalendar while you were editing")
                render(view: "edit", model: [resourcesCalendarInstance: resourcesCalendarInstance])
                return
            }
        }

        resourcesCalendarInstance.properties = params

        if (!resourcesCalendarInstance.save(flush: true)) {
            render(view: "edit", model: [resourcesCalendarInstance: resourcesCalendarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), resourcesCalendarInstance.id])
        redirect(action: "show", id: resourcesCalendarInstance.id)
    }

    def delete(Long id) {
        def resourcesCalendarInstance = ResourcesCalendar.get(id)
        if (!resourcesCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), id])
            redirect(action: "list")
            return
        }

        try {
            resourcesCalendarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar'), id])
            redirect(action: "show", id: id)
        }
    }
}
