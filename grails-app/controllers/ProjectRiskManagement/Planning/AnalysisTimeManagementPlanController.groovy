package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class AnalysisTimeManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [analysisTimeManagementPlanInstanceList: AnalysisTimeManagementPlan.list(params), analysisTimeManagementPlanInstanceTotal: AnalysisTimeManagementPlan.count()]
    }

    def create() {
        [analysisTimeManagementPlanInstance: new AnalysisTimeManagementPlan(params)]
    }

    def save() {
        def analysisTimeManagementPlanInstance = new AnalysisTimeManagementPlan(params)
        if (!analysisTimeManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [analysisTimeManagementPlanInstance: analysisTimeManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), analysisTimeManagementPlanInstance.id])
        redirect(action: "show", id: analysisTimeManagementPlanInstance.id)
    }

    def show(Long id) {
        def analysisTimeManagementPlanInstance = AnalysisTimeManagementPlan.get(id)
        if (!analysisTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [analysisTimeManagementPlanInstance: analysisTimeManagementPlanInstance]
    }

    def edit(Long id) {
        def analysisTimeManagementPlanInstance = AnalysisTimeManagementPlan.get(id)
        if (!analysisTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [analysisTimeManagementPlanInstance: analysisTimeManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def analysisTimeManagementPlanInstance = AnalysisTimeManagementPlan.get(id)
        if (!analysisTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (analysisTimeManagementPlanInstance.version > version) {
                analysisTimeManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan')] as Object[],
                          "Another user has updated this AnalysisTimeManagementPlan while you were editing")
                render(view: "edit", model: [analysisTimeManagementPlanInstance: analysisTimeManagementPlanInstance])
                return
            }
        }

        analysisTimeManagementPlanInstance.properties = params

        if (!analysisTimeManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [analysisTimeManagementPlanInstance: analysisTimeManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), analysisTimeManagementPlanInstance.id])
        redirect(action: "show", id: analysisTimeManagementPlanInstance.id)
    }

    def delete(Long id) {
        def analysisTimeManagementPlanInstance = AnalysisTimeManagementPlan.get(id)
        if (!analysisTimeManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            analysisTimeManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
