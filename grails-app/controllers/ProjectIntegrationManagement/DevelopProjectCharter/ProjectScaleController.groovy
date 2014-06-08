package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class ProjectScaleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectScaleInstanceList: ProjectScale.list(params), projectScaleInstanceTotal: ProjectScale.count()]
    }

    def create() {
        [projectScaleInstance: new ProjectScale(params)]
    }

    def save() {
        def projectScaleInstance = new ProjectScale(params)
        if (!projectScaleInstance.save(flush: true)) {
            render(view: "create", model: [projectScaleInstance: projectScaleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), projectScaleInstance.id])
        redirect(action: "show", id: projectScaleInstance.id)
    }

    def show(Long id) {
        def projectScaleInstance = ProjectScale.get(id)
        if (!projectScaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), id])
            redirect(action: "list")
            return
        }

        [projectScaleInstance: projectScaleInstance]
    }

    def edit(Long id) {
        def projectScaleInstance = ProjectScale.get(id)
        if (!projectScaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), id])
            redirect(action: "list")
            return
        }

        [projectScaleInstance: projectScaleInstance]
    }

    def update(Long id, Long version) {
        def projectScaleInstance = ProjectScale.get(id)
        if (!projectScaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectScaleInstance.version > version) {
                projectScaleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectScale.label', default: 'ProjectScale')] as Object[],
                          "Another user has updated this ProjectScale while you were editing")
                render(view: "edit", model: [projectScaleInstance: projectScaleInstance])
                return
            }
        }

        projectScaleInstance.properties = params

        if (!projectScaleInstance.save(flush: true)) {
            render(view: "edit", model: [projectScaleInstance: projectScaleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), projectScaleInstance.id])
        redirect(action: "show", id: projectScaleInstance.id)
    }

    def delete(Long id) {
        def projectScaleInstance = ProjectScale.get(id)
        if (!projectScaleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), id])
            redirect(action: "list")
            return
        }

        try {
            projectScaleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectScale.label', default: 'ProjectScale'), id])
            redirect(action: "show", id: id)
        }
    }
}
