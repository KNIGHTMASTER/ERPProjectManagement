package ProjectScopeManagement.DefineScope

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ProjectDeliverableController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ProjectDeliverable'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [projectDeliverableInstanceList: ProjectDeliverable.list(params), projectDeliverableInstanceTotal: ProjectDeliverable.count()]
    }

    def create() {
        [projectDeliverableInstance: new ProjectDeliverable(params)]
    }

    def save() {
        def projectDeliverableInstance = new ProjectDeliverable(params)
        if (!projectDeliverableInstance.save(flush: true)) {
            render(view: "create", model: [projectDeliverableInstance: projectDeliverableInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), projectDeliverableInstance.id])
        redirect(action: "show", id: projectDeliverableInstance.id)
    }

    def show(Long id) {
        def projectDeliverableInstance = ProjectDeliverable.get(id)
        if (!projectDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), id])
            redirect(action: "list")
            return
        }

        [projectDeliverableInstance: projectDeliverableInstance]
    }

    def edit(Long id) {
        def projectDeliverableInstance = ProjectDeliverable.get(id)
        if (!projectDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), id])
            redirect(action: "list")
            return
        }

        [projectDeliverableInstance: projectDeliverableInstance]
    }

    def update(Long id, Long version) {
        def projectDeliverableInstance = ProjectDeliverable.get(id)
        if (!projectDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (projectDeliverableInstance.version > version) {
                projectDeliverableInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable')] as Object[],
                          "Another user has updated this ProjectDeliverable while you were editing")
                render(view: "edit", model: [projectDeliverableInstance: projectDeliverableInstance])
                return
            }
        }

        projectDeliverableInstance.properties = params

        if (!projectDeliverableInstance.save(flush: true)) {
            render(view: "edit", model: [projectDeliverableInstance: projectDeliverableInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), projectDeliverableInstance.id])
        redirect(action: "show", id: projectDeliverableInstance.id)
    }

    def delete(Long id) {
        def projectDeliverableInstance = ProjectDeliverable.get(id)
        if (!projectDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), id])
            redirect(action: "list")
            return
        }

        try {
            projectDeliverableInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'projectDeliverable.label', default: 'ProjectDeliverable'), id])
            redirect(action: "show", id: id)
        }
    }
}
