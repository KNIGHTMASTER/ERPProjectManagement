package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectOverviewController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectOverview'
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
            results4 = ProjectOverview.findByProjectName(results3)
        }else{
            results4 = ProjectOverview.list(params)
        }
        [projectOverviewInstanceList: results4, projectOverviewInstanceTotal: ProjectOverview.count()]
    }

    def create() {
        [projectOverviewInstance: new ProjectOverview(params)]
    }

    def save() {
        def projectOverviewInstance = new ProjectOverview(params)
        if (!projectOverviewInstance.save(flush: true)) {
            render(view: "create", model: [projectOverviewInstance: projectOverviewInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), projectOverviewInstance.id])
        redirect(action: "show", id: projectOverviewInstance.id)
    }

    def show(Long id) {
        def projectOverviewInstance = ProjectOverview.get(id)
        if (!projectOverviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), id])
            redirect(action: "list")
            return
        }

        [projectOverviewInstance: projectOverviewInstance]
    }

    def edit(Long id) {
        def projectOverviewInstance = ProjectOverview.get(id)
        if (!projectOverviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), id])
            redirect(action: "list")
            return
        }

        [projectOverviewInstance: projectOverviewInstance]
    }

    def update(Long id, Long version) {
        def projectOverviewInstance = ProjectOverview.get(id)
        if (!projectOverviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectOverviewInstance.version > version) {
                projectOverviewInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectOverview.label', default: 'ProjectOverview')] as Object[],
                          "Another user has updated this ProjectOverview while you were editing")
                render(view: "edit", model: [projectOverviewInstance: projectOverviewInstance])
                return
            }
        }

        projectOverviewInstance.properties = params

        if (!projectOverviewInstance.save(flush: true)) {
            render(view: "edit", model: [projectOverviewInstance: projectOverviewInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), projectOverviewInstance.id])
        redirect(action: "show", id: projectOverviewInstance.id)
    }

    def delete(Long id) {
        def projectOverviewInstance = ProjectOverview.get(id)
        if (!projectOverviewInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), id])
            redirect(action: "list")
            return
        }

        try {
            projectOverviewInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectOverview.label', default: 'ProjectOverview'), id])
            redirect(action: "show", id: id)
        }
    }
}
