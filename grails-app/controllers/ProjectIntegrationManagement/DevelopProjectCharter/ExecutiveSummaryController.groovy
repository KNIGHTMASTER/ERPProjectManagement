package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class ExecutiveSummaryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=ExecutiveSummary'
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
            results4 = ExecutiveSummary.findByProjectName(results3)
        }else{
            results4 = ExecutiveSummary.list(params)
        }
        [executiveSummaryInstanceList: results4, executiveSummaryInstanceTotal: ExecutiveSummary.count()]
    }

    def create() {
        [executiveSummaryInstance: new ExecutiveSummary(params)]
    }

    def save() {
        def executiveSummaryInstance = new ExecutiveSummary(params)
        if (!executiveSummaryInstance.save(flush: true)) {
            render(view: "create", model: [executiveSummaryInstance: executiveSummaryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), executiveSummaryInstance.id])
        redirect(action: "show", id: executiveSummaryInstance.id)
    }

    def show(Long id) {
        def executiveSummaryInstance = ExecutiveSummary.get(id)
        if (!executiveSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), id])
            redirect(action: "list")
            return
        }

        [executiveSummaryInstance: executiveSummaryInstance]
    }

    def edit(Long id) {
        def executiveSummaryInstance = ExecutiveSummary.get(id)
        if (!executiveSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), id])
            redirect(action: "list")
            return
        }

        [executiveSummaryInstance: executiveSummaryInstance]
    }

    def update(Long id, Long version) {
        def executiveSummaryInstance = ExecutiveSummary.get(id)
        if (!executiveSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (executiveSummaryInstance.version > version) {
                executiveSummaryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'executiveSummary.label', default: 'ExecutiveSummary')] as Object[],
                          "Another user has updated this ExecutiveSummary while you were editing")
                render(view: "edit", model: [executiveSummaryInstance: executiveSummaryInstance])
                return
            }
        }

        executiveSummaryInstance.properties = params

        if (!executiveSummaryInstance.save(flush: true)) {
            render(view: "edit", model: [executiveSummaryInstance: executiveSummaryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), executiveSummaryInstance.id])
        redirect(action: "show", id: executiveSummaryInstance.id)
    }

    def delete(Long id) {
        def executiveSummaryInstance = ExecutiveSummary.get(id)
        if (!executiveSummaryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), id])
            redirect(action: "list")
            return
        }

        try {
            executiveSummaryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'executiveSummary.label', default: 'ExecutiveSummary'), id])
            redirect(action: "show", id: id)
        }
    }
}
