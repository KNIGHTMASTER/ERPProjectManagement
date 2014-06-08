package ProjectIntegrationManagement.DirectAndManageProjectExecution

import org.springframework.dao.DataIntegrityViolationException

class ProjectStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectStatusInstanceList: ProjectStatus.list(params), projectStatusInstanceTotal: ProjectStatus.count()]
    }

    def create() {
        [projectStatusInstance: new ProjectStatus(params)]
    }

    def save() {
        def projectStatusInstance = new ProjectStatus(params)
        if (!projectStatusInstance.save(flush: true)) {
            render(view: "create", model: [projectStatusInstance: projectStatusInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), projectStatusInstance.id])
        redirect(action: "show", id: projectStatusInstance.id)
    }

    def show(Long id) {
        def projectStatusInstance = ProjectStatus.get(id)
        if (!projectStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), id])
            redirect(action: "list")
            return
        }

        [projectStatusInstance: projectStatusInstance]
    }

    def edit(Long id) {
        def projectStatusInstance = ProjectStatus.get(id)
        if (!projectStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), id])
            redirect(action: "list")
            return
        }

        [projectStatusInstance: projectStatusInstance]
    }

    def update(Long id, Long version) {
        def projectStatusInstance = ProjectStatus.get(id)
        if (!projectStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectStatusInstance.version > version) {
                projectStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectStatus.label', default: 'ProjectStatus')] as Object[],
                          "Another user has updated this ProjectStatus while you were editing")
                render(view: "edit", model: [projectStatusInstance: projectStatusInstance])
                return
            }
        }

        projectStatusInstance.properties = params

        if (!projectStatusInstance.save(flush: true)) {
            render(view: "edit", model: [projectStatusInstance: projectStatusInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), projectStatusInstance.id])
        redirect(action: "show", id: projectStatusInstance.id)
    }

    def delete(Long id) {
        def projectStatusInstance = ProjectStatus.get(id)
        if (!projectStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), id])
            redirect(action: "list")
            return
        }

        try {
            projectStatusInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectStatus.label', default: 'ProjectStatus'), id])
            redirect(action: "show", id: id)
        }
    }
}
