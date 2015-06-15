package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class AnalysisCostManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [analysisCostManagementPlanInstanceList: AnalysisCostManagementPlan.list(params), analysisCostManagementPlanInstanceTotal: AnalysisCostManagementPlan.count()]
    }

    def create() {
        [analysisCostManagementPlanInstance: new AnalysisCostManagementPlan(params)]
    }

    def save() {
        def analysisCostManagementPlanInstance = new AnalysisCostManagementPlan(params)
        if (!analysisCostManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [analysisCostManagementPlanInstance: analysisCostManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), analysisCostManagementPlanInstance.id])
        redirect(action: "show", id: analysisCostManagementPlanInstance.id)
    }

    def show(Long id) {
        def analysisCostManagementPlanInstance = AnalysisCostManagementPlan.get(id)
        if (!analysisCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [analysisCostManagementPlanInstance: analysisCostManagementPlanInstance]
    }

    def edit(Long id) {
        def analysisCostManagementPlanInstance = AnalysisCostManagementPlan.get(id)
        if (!analysisCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [analysisCostManagementPlanInstance: analysisCostManagementPlanInstance]
    }

    def update(Long id, Long version) {
        def analysisCostManagementPlanInstance = AnalysisCostManagementPlan.get(id)
        if (!analysisCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (analysisCostManagementPlanInstance.version > version) {
                analysisCostManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan')] as Object[],
                          "Another user has updated this AnalysisCostManagementPlan while you were editing")
                render(view: "edit", model: [analysisCostManagementPlanInstance: analysisCostManagementPlanInstance])
                return
            }
        }

        analysisCostManagementPlanInstance.properties = params

        if (!analysisCostManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [analysisCostManagementPlanInstance: analysisCostManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), analysisCostManagementPlanInstance.id])
        redirect(action: "show", id: analysisCostManagementPlanInstance.id)
    }

    def delete(Long id) {
        def analysisCostManagementPlanInstance = AnalysisCostManagementPlan.get(id)
        if (!analysisCostManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            analysisCostManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
