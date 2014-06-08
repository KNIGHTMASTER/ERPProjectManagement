package ProjectIntegrationManagement.DirectAndManageProjectExecution

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ManageTeamMemberAssignedToProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ManageTeamMembersAssignedToProject'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def projectProposal = ProjectProposal.findByProjectName(sow)
            def projectCharter = ProjectCharter.findByProjectName(projectProposal)
            results = ManageTeamMemberAssignedToProject.findAllByProjectName(projectCharter)
        }else{
            results = ManageTeamMemberAssignedToProject.list(params)
        }
        [manageTeamMemberAssignedToProjectInstanceList: results, manageTeamMemberAssignedToProjectInstanceTotal: results.size()]
    }

    def create() {
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def projectProposal = ProjectProposal.findByProjectName(sow)
            def projectCharter = ProjectCharter.findByProjectName(projectProposal)
            def milestones = sow.milestones
            List activities = []
            milestones.each{
                activities.addAll(it.activity)
            }
            [manageTeamMemberAssignedToProjectInstance: new ManageTeamMemberAssignedToProject(params), projectName: projectCharter, aktivitas: activities]
        }else{
            [manageTeamMemberAssignedToProjectInstance: new ManageTeamMemberAssignedToProject(params)]
        }
    }

    def save() {
        def manageTeamMemberAssignedToProjectInstance = new ManageTeamMemberAssignedToProject(params)
        if (!manageTeamMemberAssignedToProjectInstance.save(flush: true)) {
            render(view: "create", model: [manageTeamMemberAssignedToProjectInstance: manageTeamMemberAssignedToProjectInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), manageTeamMemberAssignedToProjectInstance.id])
        redirect(action: "show", id: manageTeamMemberAssignedToProjectInstance.id)
    }

    def show(Long id) {
        def manageTeamMemberAssignedToProjectInstance = ManageTeamMemberAssignedToProject.get(id)
        if (!manageTeamMemberAssignedToProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), id])
            redirect(action: "list")
            return
        }

        [manageTeamMemberAssignedToProjectInstance: manageTeamMemberAssignedToProjectInstance]
    }

    def edit(Long id) {
        def manageTeamMemberAssignedToProjectInstance = ManageTeamMemberAssignedToProject.get(id)
        if (!manageTeamMemberAssignedToProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), id])
            redirect(action: "list")
            return
        }

        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def projectProposal = ProjectProposal.findByProjectName(sow)
            def projectCharter = ProjectCharter.findByProjectName(projectProposal)
            def milestones = sow.milestones
            List activities = []
            milestones.each{
                activities.addAll(it.activity)
            }
            [manageTeamMemberAssignedToProjectInstance: manageTeamMemberAssignedToProjectInstance, projectName: projectCharter, aktivitas: activities]
        }else{
            [manageTeamMemberAssignedToProjectInstance: manageTeamMemberAssignedToProjectInstance]
        }
    }

    def update(Long id, Long version) {
        def manageTeamMemberAssignedToProjectInstance = ManageTeamMemberAssignedToProject.get(id)
        if (!manageTeamMemberAssignedToProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (manageTeamMemberAssignedToProjectInstance.version > version) {
                manageTeamMemberAssignedToProjectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject')] as Object[],
                          "Another user has updated this ManageTeamMemberAssignedToProject while you were editing")
                render(view: "edit", model: [manageTeamMemberAssignedToProjectInstance: manageTeamMemberAssignedToProjectInstance])
                return
            }
        }

        manageTeamMemberAssignedToProjectInstance.properties = params

        if (!manageTeamMemberAssignedToProjectInstance.save(flush: true)) {
            render(view: "edit", model: [manageTeamMemberAssignedToProjectInstance: manageTeamMemberAssignedToProjectInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), manageTeamMemberAssignedToProjectInstance.id])
        redirect(action: "show", id: manageTeamMemberAssignedToProjectInstance.id)
    }

    def delete(Long id) {
        def manageTeamMemberAssignedToProjectInstance = ManageTeamMemberAssignedToProject.get(id)
        if (!manageTeamMemberAssignedToProjectInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), id])
            redirect(action: "list")
            return
        }

        try {
            manageTeamMemberAssignedToProjectInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject'), id])
            redirect(action: "show", id: id)
        }
    }
}
