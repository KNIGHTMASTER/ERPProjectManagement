package ProjectProcurementManagement.CloseProcurements

import org.springframework.dao.DataIntegrityViolationException

class CloseProcurementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [closeProcurementInstanceList: CloseProcurement.list(params), closeProcurementInstanceTotal: CloseProcurement.count()]
    }

    def create() {
        [closeProcurementInstance: new CloseProcurement(params)]
    }

    def save() {
        def closeProcurementInstance = new CloseProcurement(params)
        if (!closeProcurementInstance.save(flush: true)) {
            render(view: "create", model: [closeProcurementInstance: closeProcurementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), closeProcurementInstance.id])
        redirect(action: "show", id: closeProcurementInstance.id)
    }

    def show(Long id) {
        def closeProcurementInstance = CloseProcurement.get(id)
        if (!closeProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), id])
            redirect(action: "list")
            return
        }

        [closeProcurementInstance: closeProcurementInstance]
    }

    def edit(Long id) {
        def closeProcurementInstance = CloseProcurement.get(id)
        if (!closeProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), id])
            redirect(action: "list")
            return
        }

        [closeProcurementInstance: closeProcurementInstance]
    }

    def update(Long id, Long version) {
        def closeProcurementInstance = CloseProcurement.get(id)
        if (!closeProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (closeProcurementInstance.version > version) {
                closeProcurementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'closeProcurement.label', default: 'CloseProcurement')] as Object[],
                          "Another user has updated this CloseProcurement while you were editing")
                render(view: "edit", model: [closeProcurementInstance: closeProcurementInstance])
                return
            }
        }

        closeProcurementInstance.properties = params

        if (!closeProcurementInstance.save(flush: true)) {
            render(view: "edit", model: [closeProcurementInstance: closeProcurementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), closeProcurementInstance.id])
        redirect(action: "show", id: closeProcurementInstance.id)
    }

    def delete(Long id) {
        def closeProcurementInstance = CloseProcurement.get(id)
        if (!closeProcurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), id])
            redirect(action: "list")
            return
        }

        try {
            closeProcurementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'closeProcurement.label', default: 'CloseProcurement'), id])
            redirect(action: "show", id: id)
        }
    }
}
