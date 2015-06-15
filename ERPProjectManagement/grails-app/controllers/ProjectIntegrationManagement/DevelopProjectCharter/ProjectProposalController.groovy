package ProjectIntegrationManagement.DevelopProjectCharter

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectProposalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectProposal'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results = ProjectProposal.findAllByProjectName(cari)
        }else{
            results = ProjectProposal.list(params)
        }
        [projectProposalInstanceList: results, projectProposalInstanceTotal: ProjectProposal.count()]
    }

    def create() {
        [projectProposalInstance: new ProjectProposal(params)]
    }

    def save() {
        def projectProposalInstance = new ProjectProposal(params)
        if (!projectProposalInstance.save(flush: true)) {
            render(view: "create", model: [projectProposalInstance: projectProposalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), projectProposalInstance.id])
        redirect(action: "show", id: projectProposalInstance.id)
    }

    def show(Long id) {
        def projectProposalInstance = ProjectProposal.get(id)
        if (!projectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), id])
            redirect(action: "list")
            return
        }

        [projectProposalInstance: projectProposalInstance]
    }

    def edit(Long id) {
        def projectProposalInstance = ProjectProposal.get(id)
        if (!projectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), id])
            redirect(action: "list")
            return
        }

        [projectProposalInstance: projectProposalInstance]
    }

    def update(Long id, Long version) {
        def projectProposalInstance = ProjectProposal.get(id)
        if (!projectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectProposalInstance.version > version) {
                projectProposalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectProposal.label', default: 'ProjectProposal')] as Object[],
                          "Another user has updated this ProjectProposal while you were editing")
                render(view: "edit", model: [projectProposalInstance: projectProposalInstance])
                return
            }
        }

        projectProposalInstance.properties = params

        if (!projectProposalInstance.save(flush: true)) {
            render(view: "edit", model: [projectProposalInstance: projectProposalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), projectProposalInstance.id])
        redirect(action: "show", id: projectProposalInstance.id)
    }

    def delete(Long id) {
        def projectProposalInstance = ProjectProposal.get(id)
        if (!projectProposalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), id])
            redirect(action: "list")
            return
        }

        try {
            projectProposalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectProposal.label', default: 'ProjectProposal'), id])
            redirect(action: "show", id: id)
        }
    }
}
