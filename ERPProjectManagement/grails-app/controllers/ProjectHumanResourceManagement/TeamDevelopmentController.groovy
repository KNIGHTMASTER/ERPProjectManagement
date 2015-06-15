package ProjectHumanResourceManagement

import org.springframework.dao.DataIntegrityViolationException

class TeamDevelopmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [teamDevelopmentInstanceList: TeamDevelopment.list(params), teamDevelopmentInstanceTotal: TeamDevelopment.count()]
    }

    def create() {
        [teamDevelopmentInstance: new TeamDevelopment(params)]
    }

    def save() {
        def teamDevelopmentInstance = new TeamDevelopment(params)
        if (!teamDevelopmentInstance.save(flush: true)) {
            render(view: "create", model: [teamDevelopmentInstance: teamDevelopmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), teamDevelopmentInstance.id])
        redirect(action: "show", id: teamDevelopmentInstance.id)
    }

    def show(Long id) {
        def teamDevelopmentInstance = TeamDevelopment.get(id)
        if (!teamDevelopmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), id])
            redirect(action: "list")
            return
        }

        [teamDevelopmentInstance: teamDevelopmentInstance]
    }

    def edit(Long id) {
        def teamDevelopmentInstance = TeamDevelopment.get(id)
        if (!teamDevelopmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), id])
            redirect(action: "list")
            return
        }

        [teamDevelopmentInstance: teamDevelopmentInstance]
    }

    def update(Long id, Long version) {
        def teamDevelopmentInstance = TeamDevelopment.get(id)
        if (!teamDevelopmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (teamDevelopmentInstance.version > version) {
                teamDevelopmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'teamDevelopment.label', default: 'TeamDevelopment')] as Object[],
                          "Another user has updated this TeamDevelopment while you were editing")
                render(view: "edit", model: [teamDevelopmentInstance: teamDevelopmentInstance])
                return
            }
        }

        teamDevelopmentInstance.properties = params

        if (!teamDevelopmentInstance.save(flush: true)) {
            render(view: "edit", model: [teamDevelopmentInstance: teamDevelopmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), teamDevelopmentInstance.id])
        redirect(action: "show", id: teamDevelopmentInstance.id)
    }

    def delete(Long id) {
        def teamDevelopmentInstance = TeamDevelopment.get(id)
        if (!teamDevelopmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), id])
            redirect(action: "list")
            return
        }

        try {
            teamDevelopmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment'), id])
            redirect(action: "show", id: id)
        }
    }
}
