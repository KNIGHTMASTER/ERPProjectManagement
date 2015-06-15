package ProjectProcurementManagement.AdministerProcurements

import org.springframework.dao.DataIntegrityViolationException

class PurchaseVendorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [purchaseVendorInstanceList: PurchaseVendor.list(params), purchaseVendorInstanceTotal: PurchaseVendor.count()]
    }

    def create() {
        [purchaseVendorInstance: new PurchaseVendor(params)]
    }

    def save() {
        def purchaseVendorInstance = new PurchaseVendor(params)
        if (!purchaseVendorInstance.save(flush: true)) {
            render(view: "create", model: [purchaseVendorInstance: purchaseVendorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), purchaseVendorInstance.id])
        redirect(action: "show", id: purchaseVendorInstance.id)
    }

    def show(Long id) {
        def purchaseVendorInstance = PurchaseVendor.get(id)
        if (!purchaseVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), id])
            redirect(action: "list")
            return
        }

        [purchaseVendorInstance: purchaseVendorInstance]
    }

    def edit(Long id) {
        def purchaseVendorInstance = PurchaseVendor.get(id)
        if (!purchaseVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), id])
            redirect(action: "list")
            return
        }

        [purchaseVendorInstance: purchaseVendorInstance]
    }

    def update(Long id, Long version) {
        def purchaseVendorInstance = PurchaseVendor.get(id)
        if (!purchaseVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (purchaseVendorInstance.version > version) {
                purchaseVendorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'purchaseVendor.label', default: 'PurchaseVendor')] as Object[],
                          "Another user has updated this PurchaseVendor while you were editing")
                render(view: "edit", model: [purchaseVendorInstance: purchaseVendorInstance])
                return
            }
        }

        purchaseVendorInstance.properties = params

        if (!purchaseVendorInstance.save(flush: true)) {
            render(view: "edit", model: [purchaseVendorInstance: purchaseVendorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), purchaseVendorInstance.id])
        redirect(action: "show", id: purchaseVendorInstance.id)
    }

    def delete(Long id) {
        def purchaseVendorInstance = PurchaseVendor.get(id)
        if (!purchaseVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), id])
            redirect(action: "list")
            return
        }

        try {
            purchaseVendorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'purchaseVendor.label', default: 'PurchaseVendor'), id])
            redirect(action: "show", id: id)
        }
    }
}
