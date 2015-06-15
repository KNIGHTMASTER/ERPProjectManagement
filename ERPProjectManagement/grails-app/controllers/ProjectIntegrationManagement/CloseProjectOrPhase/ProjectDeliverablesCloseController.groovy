package ProjectIntegrationManagement.CloseProjectOrPhase

import org.springframework.dao.DataIntegrityViolationException

class ProjectDeliverablesCloseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectDeliverablesCloseInstanceList: ProjectDeliverablesClose.list(params), projectDeliverablesCloseInstanceTotal: ProjectDeliverablesClose.count()]
    }

    def create() {
        [projectDeliverablesCloseInstance: new ProjectDeliverablesClose(params)]
    }

    def save() {
        def projectDeliverablesCloseInstance = new ProjectDeliverablesClose(params)
        if (!projectDeliverablesCloseInstance.save(flush: true)) {
            render(view: "create", model: [projectDeliverablesCloseInstance: projectDeliverablesCloseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), projectDeliverablesCloseInstance.id])
        redirect(action: "show", id: projectDeliverablesCloseInstance.id)
    }

    def show(Long id) {
        def projectDeliverablesCloseInstance = ProjectDeliverablesClose.get(id)
        if (!projectDeliverablesCloseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), id])
            redirect(action: "list")
            return
        }

        [projectDeliverablesCloseInstance: projectDeliverablesCloseInstance]
    }

    def edit(Long id) {
        def projectDeliverablesCloseInstance = ProjectDeliverablesClose.get(id)
        if (!projectDeliverablesCloseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), id])
            redirect(action: "list")
            return
        }

        [projectDeliverablesCloseInstance: projectDeliverablesCloseInstance]
    }

    def update(Long id, Long version) {
        def projectDeliverablesCloseInstance = ProjectDeliverablesClose.get(id)
        if (!projectDeliverablesCloseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectDeliverablesCloseInstance.version > version) {
                projectDeliverablesCloseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose')] as Object[],
                          "Another user has updated this ProjectDeliverablesClose while you were editing")
                render(view: "edit", model: [projectDeliverablesCloseInstance: projectDeliverablesCloseInstance])
                return
            }
        }

        projectDeliverablesCloseInstance.properties = params

        if (!projectDeliverablesCloseInstance.save(flush: true)) {
            render(view: "edit", model: [projectDeliverablesCloseInstance: projectDeliverablesCloseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), projectDeliverablesCloseInstance.id])
        redirect(action: "show", id: projectDeliverablesCloseInstance.id)
    }

    def delete(Long id) {
        def projectDeliverablesCloseInstance = ProjectDeliverablesClose.get(id)
        if (!projectDeliverablesCloseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), id])
            redirect(action: "list")
            return
        }

        try {
            projectDeliverablesCloseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose'), id])
            redirect(action: "show", id: id)
        }
    }
}
