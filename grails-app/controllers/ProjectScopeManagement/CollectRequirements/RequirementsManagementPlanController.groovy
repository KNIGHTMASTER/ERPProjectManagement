package ProjectScopeManagement.CollectRequirements

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class RequirementsManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=RequirementsManagementPlan'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requirementsManagementPlanInstanceList: RequirementsManagementPlan.list(params), requirementsManagementPlanInstanceTotal: RequirementsManagementPlan.count()]
    }

    def create() {
        [requirementsManagementPlanInstance: new RequirementsManagementPlan(params)]
    }

    def save() {
        def requirementsManagementPlanInstance = new RequirementsManagementPlan(params)
        if (!requirementsManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [requirementsManagementPlanInstance: requirementsManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), requirementsManagementPlanInstance.id])
        redirect(action: "show", id: requirementsManagementPlanInstance.id)
    }

    def show(Long id) {
        def requirementsManagementPlanInstance = RequirementsManagementPlan.get(id)
        if (!requirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [requirementsManagementPlanInstance: requirementsManagementPlanInstance]
    }

    def edit(Long id) {
        def requirementsManagementPlanInstance = RequirementsManagementPlan.get(id)
        if (!requirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [requirementsManagementPlanInstance: requirementsManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def requirementsManagementPlanInstance = RequirementsManagementPlan.get(id)
        if (!requirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requirementsManagementPlanInstance.version > version) {
                requirementsManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan')] as Object[],
                          "Another user has updated this RequirementsManagementPlan while you were editing")
                render(view: "edit", model: [requirementsManagementPlanInstance: requirementsManagementPlanInstance])
                return
            }
        }

        requirementsManagementPlanInstance.properties = params

        if (!requirementsManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [requirementsManagementPlanInstance: requirementsManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), requirementsManagementPlanInstance.id])
        redirect(action: "show", id: requirementsManagementPlanInstance.id)
    }

    def delete(Long id) {
        def requirementsManagementPlanInstance = RequirementsManagementPlan.get(id)
        if (!requirementsManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            requirementsManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
