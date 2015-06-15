package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class AnalysisProjectScopeStatementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [analysisProjectScopeStatementInstanceList: AnalysisProjectScopeStatement.list(params), analysisProjectScopeStatementInstanceTotal: AnalysisProjectScopeStatement.count()]
    }

    def create() {
        [analysisProjectScopeStatementInstance: new AnalysisProjectScopeStatement(params)]
    }

    def save() {
        def analysisProjectScopeStatementInstance = new AnalysisProjectScopeStatement(params)
        if (!analysisProjectScopeStatementInstance.save(flush: true)) {
            render(view: "create", model: [analysisProjectScopeStatementInstance: analysisProjectScopeStatementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), analysisProjectScopeStatementInstance.id])
        redirect(action: "show", id: analysisProjectScopeStatementInstance.id)
    }

    def show(Long id) {
        def analysisProjectScopeStatementInstance = AnalysisProjectScopeStatement.get(id)
        if (!analysisProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        [analysisProjectScopeStatementInstance: analysisProjectScopeStatementInstance]
    }

    def edit(Long id) {
        def analysisProjectScopeStatementInstance = AnalysisProjectScopeStatement.get(id)
        if (!analysisProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        [analysisProjectScopeStatementInstance: analysisProjectScopeStatementInstance]
    }

    def update(Long id, Long version) {
        def analysisProjectScopeStatementInstance = AnalysisProjectScopeStatement.get(id)
        if (!analysisProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (analysisProjectScopeStatementInstance.version > version) {
                analysisProjectScopeStatementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement')] as Object[],
                          "Another user has updated this AnalysisProjectScopeStatement while you were editing")
                render(view: "edit", model: [analysisProjectScopeStatementInstance: analysisProjectScopeStatementInstance])
                return
            }
        }

        analysisProjectScopeStatementInstance.properties = params

        if (!analysisProjectScopeStatementInstance.save(flush: true)) {
            render(view: "edit", model: [analysisProjectScopeStatementInstance: analysisProjectScopeStatementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), analysisProjectScopeStatementInstance.id])
        redirect(action: "show", id: analysisProjectScopeStatementInstance.id)
    }

    def delete(Long id) {
        def analysisProjectScopeStatementInstance = AnalysisProjectScopeStatement.get(id)
        if (!analysisProjectScopeStatementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), id])
            redirect(action: "list")
            return
        }

        try {
            analysisProjectScopeStatementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'analysisProjectScopeStatement.label', default: 'AnalysisProjectScopeStatement'), id])
            redirect(action: "show", id: id)
        }
    }
}
