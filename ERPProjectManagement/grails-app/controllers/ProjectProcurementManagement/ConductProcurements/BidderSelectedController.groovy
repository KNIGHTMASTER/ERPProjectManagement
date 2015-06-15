package ProjectProcurementManagement.ConductProcurements

import org.springframework.dao.DataIntegrityViolationException

class BidderSelectedController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bidderSelectedInstanceList: BidderSelected.list(params), bidderSelectedInstanceTotal: BidderSelected.count()]
    }

    def create() {
        [bidderSelectedInstance: new BidderSelected(params)]
    }

    def save() {
        def bidderSelectedInstance = new BidderSelected(params)
        if (!bidderSelectedInstance.save(flush: true)) {
            render(view: "create", model: [bidderSelectedInstance: bidderSelectedInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), bidderSelectedInstance.id])
        redirect(action: "show", id: bidderSelectedInstance.id)
    }

    def show(Long id) {
        def bidderSelectedInstance = BidderSelected.get(id)
        if (!bidderSelectedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), id])
            redirect(action: "list")
            return
        }

        [bidderSelectedInstance: bidderSelectedInstance]
    }

    def edit(Long id) {
        def bidderSelectedInstance = BidderSelected.get(id)
        if (!bidderSelectedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), id])
            redirect(action: "list")
            return
        }

        [bidderSelectedInstance: bidderSelectedInstance]
    }

    def update(Long id, Long version) {
        def bidderSelectedInstance = BidderSelected.get(id)
        if (!bidderSelectedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bidderSelectedInstance.version > version) {
                bidderSelectedInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bidderSelected.label', default: 'BidderSelected')] as Object[],
                          "Another user has updated this BidderSelected while you were editing")
                render(view: "edit", model: [bidderSelectedInstance: bidderSelectedInstance])
                return
            }
        }

        bidderSelectedInstance.properties = params

        if (!bidderSelectedInstance.save(flush: true)) {
            render(view: "edit", model: [bidderSelectedInstance: bidderSelectedInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), bidderSelectedInstance.id])
        redirect(action: "show", id: bidderSelectedInstance.id)
    }

    def delete(Long id) {
        def bidderSelectedInstance = BidderSelected.get(id)
        if (!bidderSelectedInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), id])
            redirect(action: "list")
            return
        }

        try {
            bidderSelectedInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bidderSelected.label', default: 'BidderSelected'), id])
            redirect(action: "show", id: id)
        }
    }
}
