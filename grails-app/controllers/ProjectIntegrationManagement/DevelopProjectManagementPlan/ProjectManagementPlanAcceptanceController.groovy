package ProjectIntegrationManagement.DevelopProjectManagementPlan

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectManagementPlanAcceptanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri :"/chooseProject?tautan=ProjectManagementPlanAcceptance"
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            result = ProjectManagementPlanAcceptance.findAllByProjectName(charter)
        }else{
            result = ProjectManagementPlanAcceptance.list(params)
        }
        [projectManagementPlanAcceptanceInstanceList: result, projectManagementPlanAcceptanceInstanceTotal: ProjectManagementPlanAcceptance.count()]
    }

    def create() {
        [projectManagementPlanAcceptanceInstance: new ProjectManagementPlanAcceptance(params)]
    }

    def save() {
        def projectManagementPlanAcceptanceInstance = new ProjectManagementPlanAcceptance(params)
        if (!projectManagementPlanAcceptanceInstance.save(flush: true)) {
            render(view: "create", model: [projectManagementPlanAcceptanceInstance: projectManagementPlanAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), projectManagementPlanAcceptanceInstance.id])
        redirect(action: "show", id: projectManagementPlanAcceptanceInstance.id)
    }

    def show(Long id) {
        def projectManagementPlanAcceptanceInstance = ProjectManagementPlanAcceptance.get(id)
        if (!projectManagementPlanAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), id])
            redirect(action: "list")
            return
        }

        [projectManagementPlanAcceptanceInstance: projectManagementPlanAcceptanceInstance]
    }

    def edit(Long id) {
        def projectManagementPlanAcceptanceInstance = ProjectManagementPlanAcceptance.get(id)
        if (!projectManagementPlanAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), id])
            redirect(action: "list")
            return
        }

        [projectManagementPlanAcceptanceInstance: projectManagementPlanAcceptanceInstance]
    }

    def update(Long id, Long version) {
        def projectManagementPlanAcceptanceInstance = ProjectManagementPlanAcceptance.get(id)
        if (!projectManagementPlanAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectManagementPlanAcceptanceInstance.version > version) {
                projectManagementPlanAcceptanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance')] as Object[],
                          "Another user has updated this ProjectManagementPlanAcceptance while you were editing")
                render(view: "edit", model: [projectManagementPlanAcceptanceInstance: projectManagementPlanAcceptanceInstance])
                return
            }
        }

        projectManagementPlanAcceptanceInstance.properties = params

        if (!projectManagementPlanAcceptanceInstance.save(flush: true)) {
            render(view: "edit", model: [projectManagementPlanAcceptanceInstance: projectManagementPlanAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), projectManagementPlanAcceptanceInstance.id])
        redirect(action: "show", id: projectManagementPlanAcceptanceInstance.id)
    }

    def delete(Long id) {
        def projectManagementPlanAcceptanceInstance = ProjectManagementPlanAcceptance.get(id)
        if (!projectManagementPlanAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), id])
            redirect(action: "list")
            return
        }

        try {
            projectManagementPlanAcceptanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance'), id])
            redirect(action: "show", id: id)
        }
    }
}
