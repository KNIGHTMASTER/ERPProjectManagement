package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class ProjectTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectTypeInstanceList: ProjectType.list(params), projectTypeInstanceTotal: ProjectType.count()]
    }

    def create() {
        [projectTypeInstance: new ProjectType(params)]
    }

    def save() {
        def projectTypeInstance = new ProjectType(params)
        if (!projectTypeInstance.save(flush: true)) {
            render(view: "create", model: [projectTypeInstance: projectTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectType.label', default: 'ProjectType'), projectTypeInstance.id])
        redirect(action: "show", id: projectTypeInstance.id)
    }

    def show(Long id) {
        def projectTypeInstance = ProjectType.get(id)
        if (!projectTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
            redirect(action: "list")
            return
        }

        [projectTypeInstance: projectTypeInstance]
    }

    def edit(Long id) {
        def projectTypeInstance = ProjectType.get(id)
        if (!projectTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
            redirect(action: "list")
            return
        }

        [projectTypeInstance: projectTypeInstance]
    }

    def update(Long id, Long version) {
        def projectTypeInstance = ProjectType.get(id)
        if (!projectTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectTypeInstance.version > version) {
                projectTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectType.label', default: 'ProjectType')] as Object[],
                          "Another user has updated this ProjectType while you were editing")
                render(view: "edit", model: [projectTypeInstance: projectTypeInstance])
                return
            }
        }

        projectTypeInstance.properties = params

        if (!projectTypeInstance.save(flush: true)) {
            render(view: "edit", model: [projectTypeInstance: projectTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectType.label', default: 'ProjectType'), projectTypeInstance.id])
        redirect(action: "show", id: projectTypeInstance.id)
    }

    def delete(Long id) {
        def projectTypeInstance = ProjectType.get(id)
        if (!projectTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
            redirect(action: "list")
            return
        }

        try {
            projectTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectType.label', default: 'ProjectType'), id])
            redirect(action: "show", id: id)
        }
    }
}
