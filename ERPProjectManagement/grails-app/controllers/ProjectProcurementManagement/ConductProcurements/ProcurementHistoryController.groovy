package ProjectProcurementManagement.ConductProcurements

import org.springframework.dao.DataIntegrityViolationException

class ProcurementHistoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [procurementHistoryInstanceList: ProcurementHistory.list(params), procurementHistoryInstanceTotal: ProcurementHistory.count()]
    }

    def create() {
        [procurementHistoryInstance: new ProcurementHistory(params)]
    }

    def save() {
        def procurementHistoryInstance = new ProcurementHistory(params)
        if (!procurementHistoryInstance.save(flush: true)) {
            render(view: "create", model: [procurementHistoryInstance: procurementHistoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), procurementHistoryInstance.id])
        redirect(action: "show", id: procurementHistoryInstance.id)
    }

    def show(Long id) {
        def procurementHistoryInstance = ProcurementHistory.get(id)
        if (!procurementHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), id])
            redirect(action: "list")
            return
        }

        [procurementHistoryInstance: procurementHistoryInstance]
    }

    def edit(Long id) {
        def procurementHistoryInstance = ProcurementHistory.get(id)
        if (!procurementHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), id])
            redirect(action: "list")
            return
        }

        [procurementHistoryInstance: procurementHistoryInstance]
    }

    def update(Long id, Long version) {
        def procurementHistoryInstance = ProcurementHistory.get(id)
        if (!procurementHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (procurementHistoryInstance.version > version) {
                procurementHistoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'procurementHistory.label', default: 'ProcurementHistory')] as Object[],
                          "Another user has updated this ProcurementHistory while you were editing")
                render(view: "edit", model: [procurementHistoryInstance: procurementHistoryInstance])
                return
            }
        }

        procurementHistoryInstance.properties = params

        if (!procurementHistoryInstance.save(flush: true)) {
            render(view: "edit", model: [procurementHistoryInstance: procurementHistoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), procurementHistoryInstance.id])
        redirect(action: "show", id: procurementHistoryInstance.id)
    }

    def delete(Long id) {
        def procurementHistoryInstance = ProcurementHistory.get(id)
        if (!procurementHistoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), id])
            redirect(action: "list")
            return
        }

        try {
            procurementHistoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'procurementHistory.label', default: 'ProcurementHistory'), id])
            redirect(action: "show", id: id)
        }
    }
}
