package ProjectTimeManagement.DefineActivity

import org.springframework.dao.DataIntegrityViolationException

class ProjectCalendarController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectCalendarInstanceList: ProjectCalendar.list(params), projectCalendarInstanceTotal: ProjectCalendar.count()]
    }

    def create() {
        [projectCalendarInstance: new ProjectCalendar(params)]
    }

    def save() {
        def projectCalendarInstance = new ProjectCalendar(params)
        if (!projectCalendarInstance.save(flush: true)) {
            render(view: "create", model: [projectCalendarInstance: projectCalendarInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), projectCalendarInstance.id])
        redirect(action: "show", id: projectCalendarInstance.id)
    }

    def show(Long id) {
        def projectCalendarInstance = ProjectCalendar.get(id)
        if (!projectCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), id])
            redirect(action: "list")
            return
        }

        [projectCalendarInstance: projectCalendarInstance]
    }

    def edit(Long id) {
        def projectCalendarInstance = ProjectCalendar.get(id)
        if (!projectCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), id])
            redirect(action: "list")
            return
        }

        [projectCalendarInstance: projectCalendarInstance]
    }

    def update(Long id, Long version) {
        def projectCalendarInstance = ProjectCalendar.get(id)
        if (!projectCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectCalendarInstance.version > version) {
                projectCalendarInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectCalendar.label', default: 'ProjectCalendar')] as Object[],
                          "Another user has updated this ProjectCalendar while you were editing")
                render(view: "edit", model: [projectCalendarInstance: projectCalendarInstance])
                return
            }
        }

        projectCalendarInstance.properties = params

        if (!projectCalendarInstance.save(flush: true)) {
            render(view: "edit", model: [projectCalendarInstance: projectCalendarInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), projectCalendarInstance.id])
        redirect(action: "show", id: projectCalendarInstance.id)
    }

    def delete(Long id) {
        def projectCalendarInstance = ProjectCalendar.get(id)
        if (!projectCalendarInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), id])
            redirect(action: "list")
            return
        }

        try {
            projectCalendarInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectCalendar.label', default: 'ProjectCalendar'), id])
            redirect(action: "show", id: id)
        }
    }
}
