package ProjectProcurementManagement.ConductProcurements

import org.springframework.dao.DataIntegrityViolationException

class ProcurementNegotiationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [procurementNegotiationInstanceList: ProcurementNegotiation.list(params), procurementNegotiationInstanceTotal: ProcurementNegotiation.count()]
    }

    def create() {
        [procurementNegotiationInstance: new ProcurementNegotiation(params)]
    }

    def save() {
        def procurementNegotiationInstance = new ProcurementNegotiation(params)
        if (!procurementNegotiationInstance.save(flush: true)) {
            render(view: "create", model: [procurementNegotiationInstance: procurementNegotiationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), procurementNegotiationInstance.id])
        redirect(action: "show", id: procurementNegotiationInstance.id)
    }

    def show(Long id) {
        def procurementNegotiationInstance = ProcurementNegotiation.get(id)
        if (!procurementNegotiationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), id])
            redirect(action: "list")
            return
        }

        [procurementNegotiationInstance: procurementNegotiationInstance]
    }

    def edit(Long id) {
        def procurementNegotiationInstance = ProcurementNegotiation.get(id)
        if (!procurementNegotiationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), id])
            redirect(action: "list")
            return
        }

        [procurementNegotiationInstance: procurementNegotiationInstance]
    }

    def update(Long id, Long version) {
        def procurementNegotiationInstance = ProcurementNegotiation.get(id)
        if (!procurementNegotiationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (procurementNegotiationInstance.version > version) {
                procurementNegotiationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation')] as Object[],
                          "Another user has updated this ProcurementNegotiation while you were editing")
                render(view: "edit", model: [procurementNegotiationInstance: procurementNegotiationInstance])
                return
            }
        }

        procurementNegotiationInstance.properties = params

        if (!procurementNegotiationInstance.save(flush: true)) {
            render(view: "edit", model: [procurementNegotiationInstance: procurementNegotiationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), procurementNegotiationInstance.id])
        redirect(action: "show", id: procurementNegotiationInstance.id)
    }

    def delete(Long id) {
        def procurementNegotiationInstance = ProcurementNegotiation.get(id)
        if (!procurementNegotiationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), id])
            redirect(action: "list")
            return
        }

        try {
            procurementNegotiationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation'), id])
            redirect(action: "show", id: id)
        }
    }
}
