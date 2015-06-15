package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class GoalsAndObjectivesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=GoalsAndObjectives'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        def results4
        def results5
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = BusinessCase.findByProjectName(results2)
            results4 = ProjectOverview.findByProjectName(results3)
            results5 = GoalsAndObjectives.findAllByProjectName(results4)
        }else{
            results5 = GoalsAndObjectives.list(params)
        }
        [goalsAndObjectivesInstanceList: results5, goalsAndObjectivesInstanceTotal: GoalsAndObjectives.count()]
    }

    def create() {
        [goalsAndObjectivesInstance: new GoalsAndObjectives(params)]
    }

    def save() {
        def goalsAndObjectivesInstance = new GoalsAndObjectives(params)
        if (!goalsAndObjectivesInstance.save(flush: true)) {
            render(view: "create", model: [goalsAndObjectivesInstance: goalsAndObjectivesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), goalsAndObjectivesInstance.id])
        redirect(action: "show", id: goalsAndObjectivesInstance.id)
    }

    def show(Long id) {
        def goalsAndObjectivesInstance = GoalsAndObjectives.get(id)
        if (!goalsAndObjectivesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), id])
            redirect(action: "list")
            return
        }

        [goalsAndObjectivesInstance: goalsAndObjectivesInstance]
    }

    def edit(Long id) {
        def goalsAndObjectivesInstance = GoalsAndObjectives.get(id)
        if (!goalsAndObjectivesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), id])
            redirect(action: "list")
            return
        }

        [goalsAndObjectivesInstance: goalsAndObjectivesInstance]
    }

    def update(Long id, Long version) {
        def goalsAndObjectivesInstance = GoalsAndObjectives.get(id)
        if (!goalsAndObjectivesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (goalsAndObjectivesInstance.version > version) {
                goalsAndObjectivesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives')] as Object[],
                          "Another user has updated this GoalsAndObjectives while you were editing")
                render(view: "edit", model: [goalsAndObjectivesInstance: goalsAndObjectivesInstance])
                return
            }
        }

        goalsAndObjectivesInstance.properties = params

        if (!goalsAndObjectivesInstance.save(flush: true)) {
            render(view: "edit", model: [goalsAndObjectivesInstance: goalsAndObjectivesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), goalsAndObjectivesInstance.id])
        redirect(action: "show", id: goalsAndObjectivesInstance.id)
    }

    def delete(Long id) {
        def goalsAndObjectivesInstance = GoalsAndObjectives.get(id)
        if (!goalsAndObjectivesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), id])
            redirect(action: "list")
            return
        }

        try {
            goalsAndObjectivesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives'), id])
            redirect(action: "show", id: id)
        }
    }
}
