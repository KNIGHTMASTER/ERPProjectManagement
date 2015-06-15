package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class ProjectProposalApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectProposalApprovalInstanceList: ProjectProposalApproval.list(params), projectProposalApprovalInstanceTotal: ProjectProposalApproval.count()]
    }

    def create() {
        [projectProposalApprovalInstance: new ProjectProposalApproval(params)]
    }

    def save() {
        def projectProposalApprovalInstance = new ProjectProposalApproval(params)
        if (!projectProposalApprovalInstance.save(flush: true)) {
            render(view: "create", model: [projectProposalApprovalInstance: projectProposalApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), projectProposalApprovalInstance.id])
        redirect(action: "show", id: projectProposalApprovalInstance.id)
    }

    def show(Long id) {
        def projectProposalApprovalInstance = ProjectProposalApproval.get(id)
        if (!projectProposalApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), id])
            redirect(action: "list")
            return
        }

        [projectProposalApprovalInstance: projectProposalApprovalInstance]
    }

    def edit(Long id) {
        def projectProposalApprovalInstance = ProjectProposalApproval.get(id)
        if (!projectProposalApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), id])
            redirect(action: "list")
            return
        }

        [projectProposalApprovalInstance: projectProposalApprovalInstance]
    }

    def update(Long id, Long version) {
        def projectProposalApprovalInstance = ProjectProposalApproval.get(id)
        if (!projectProposalApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectProposalApprovalInstance.version > version) {
                projectProposalApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval')] as Object[],
                          "Another user has updated this ProjectProposalApproval while you were editing")
                render(view: "edit", model: [projectProposalApprovalInstance: projectProposalApprovalInstance])
                return
            }
        }

        projectProposalApprovalInstance.properties = params

        if (!projectProposalApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [projectProposalApprovalInstance: projectProposalApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), projectProposalApprovalInstance.id])
        redirect(action: "show", id: projectProposalApprovalInstance.id)
    }

    def delete(Long id) {
        def projectProposalApprovalInstance = ProjectProposalApproval.get(id)
        if (!projectProposalApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            projectProposalApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
