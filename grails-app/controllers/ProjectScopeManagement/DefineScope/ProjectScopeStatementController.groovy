package ProjectScopeManagement.DefineScope

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectScopeStatementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectScopeStatement'
        }
    }

    def getNamaProyek(){
        def results2
        def results3
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
        }else{
            results3 = ProjectCharter.list(params)
        }
        return results3
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        def results4
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = ProjectScopeStatement.findByProjectName(results3)
        }else{
            results4 = ProjectScopeStatement.list(params)
        }
        [projectScopeStatementInstanceList: results4, projectScopeStatementInstanceTotal: ProjectScopeStatement.count()]
    }

    def create() {
        [projectScopeStatementInstance: new ProjectScopeStatement(params), namaProyek:getNamaProyek()]
    }

    def save() {
        def projectScopeStatementInstance = new ProjectScopeStatement(params)
        if (!projectScopeStatementInstance.save(flush: true)) {
            render(view: "create", model: [projectScopeStatementInstance: projectScopeStatementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), projectScopeStatementInstance.id])
        redirect(action: "show", id: projectScopeStatementInstance.id)
    }

    def show(Long id) {
        def projectScopeStatementInstance = ProjectScopeStatement.get(id)
        if (!projectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        [projectScopeStatementInstance: projectScopeStatementInstance]
    }

    def edit(Long id) {
        def projectScopeStatementInstance = ProjectScopeStatement.get(id)
        if (!projectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        [projectScopeStatementInstance: projectScopeStatementInstance, namaProyek:getNamaProyek()]
    }

    def update(Long id, Long version) {
        def projectScopeStatementInstance = ProjectScopeStatement.get(id)
        if (!projectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectScopeStatementInstance.version > version) {
                projectScopeStatementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement')] as Object[],
                          "Another user has updated this ProjectScopeStatement while you were editing")
                render(view: "edit", model: [projectScopeStatementInstance: projectScopeStatementInstance])
                return
            }
        }

        projectScopeStatementInstance.properties = params

        if (!projectScopeStatementInstance.save(flush: true)) {
            render(view: "edit", model: [projectScopeStatementInstance: projectScopeStatementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), projectScopeStatementInstance.id])
        redirect(action: "show", id: projectScopeStatementInstance.id)
    }

    def delete(Long id) {
        def projectScopeStatementInstance = ProjectScopeStatement.get(id)
        if (!projectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        try {
            projectScopeStatementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectScopeStatement.label', default: 'ProjectScopeStatement'), id])
            redirect(action: "show", id: id)
        }
    }
}
