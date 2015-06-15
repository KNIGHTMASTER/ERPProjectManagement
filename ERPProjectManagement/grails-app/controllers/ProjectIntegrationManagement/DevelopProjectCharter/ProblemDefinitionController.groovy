package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProblemDefinitionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProblemDefinition'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        def results4
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = BusinessCase.findByProjectName(results2)
            results4 = ProblemDefinition.findByProjectName(results3)
        }else{
            results4 = ProblemDefinition.list(params)
        }
        [problemDefinitionInstanceList: results4, problemDefinitionInstanceTotal: ProblemDefinition.count()]
    }

    def create() {
        [problemDefinitionInstance: new ProblemDefinition(params)]
    }

    def save() {
        def problemDefinitionInstance = new ProblemDefinition(params)
        if (!problemDefinitionInstance.save(flush: true)) {
            render(view: "create", model: [problemDefinitionInstance: problemDefinitionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), problemDefinitionInstance.id])
        redirect(action: "show", id: problemDefinitionInstance.id)
    }

    def show(Long id) {
        def problemDefinitionInstance = ProblemDefinition.get(id)
        if (!problemDefinitionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), id])
            redirect(action: "list")
            return
        }

        [problemDefinitionInstance: problemDefinitionInstance]
    }

    def edit(Long id) {
        def problemDefinitionInstance = ProblemDefinition.get(id)
        if (!problemDefinitionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), id])
            redirect(action: "list")
            return
        }

        [problemDefinitionInstance: problemDefinitionInstance]
    }

    def update(Long id, Long version) {
        def problemDefinitionInstance = ProblemDefinition.get(id)
        if (!problemDefinitionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (problemDefinitionInstance.version > version) {
                problemDefinitionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'problemDefinition.label', default: 'ProblemDefinition')] as Object[],
                          "Another user has updated this ProblemDefinition while you were editing")
                render(view: "edit", model: [problemDefinitionInstance: problemDefinitionInstance])
                return
            }
        }

        problemDefinitionInstance.properties = params

        if (!problemDefinitionInstance.save(flush: true)) {
            render(view: "edit", model: [problemDefinitionInstance: problemDefinitionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), problemDefinitionInstance.id])
        redirect(action: "show", id: problemDefinitionInstance.id)
    }

    def delete(Long id) {
        def problemDefinitionInstance = ProblemDefinition.get(id)
        if (!problemDefinitionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), id])
            redirect(action: "list")
            return
        }

        try {
            problemDefinitionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'problemDefinition.label', default: 'ProblemDefinition'), id])
            redirect(action: "show", id: id)
        }
    }
}
