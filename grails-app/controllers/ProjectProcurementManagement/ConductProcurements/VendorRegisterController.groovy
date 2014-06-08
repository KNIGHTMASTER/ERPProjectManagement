package ProjectProcurementManagement.ConductProcurements

import org.springframework.dao.DataIntegrityViolationException

class VendorRegisterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vendorRegisterInstanceList: VendorRegister.list(params), vendorRegisterInstanceTotal: VendorRegister.count()]
    }

    def create() {
        [vendorRegisterInstance: new VendorRegister(params)]
    }

    def save() {
        def vendorRegisterInstance = new VendorRegister(params)
        if (!vendorRegisterInstance.save(flush: true)) {
            render(view: "create", model: [vendorRegisterInstance: vendorRegisterInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), vendorRegisterInstance.id])
        redirect(action: "show", id: vendorRegisterInstance.id)
    }

    def show(Long id) {
        def vendorRegisterInstance = VendorRegister.get(id)
        if (!vendorRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), id])
            redirect(action: "list")
            return
        }

        [vendorRegisterInstance: vendorRegisterInstance]
    }

    def edit(Long id) {
        def vendorRegisterInstance = VendorRegister.get(id)
        if (!vendorRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), id])
            redirect(action: "list")
            return
        }

        [vendorRegisterInstance: vendorRegisterInstance]
    }

    def update(Long id, Long version) {
        def vendorRegisterInstance = VendorRegister.get(id)
        if (!vendorRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vendorRegisterInstance.version > version) {
                vendorRegisterInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vendorRegister.label', default: 'VendorRegister')] as Object[],
                          "Another user has updated this VendorRegister while you were editing")
                render(view: "edit", model: [vendorRegisterInstance: vendorRegisterInstance])
                return
            }
        }

        vendorRegisterInstance.properties = params

        if (!vendorRegisterInstance.save(flush: true)) {
            render(view: "edit", model: [vendorRegisterInstance: vendorRegisterInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), vendorRegisterInstance.id])
        redirect(action: "show", id: vendorRegisterInstance.id)
    }

    def delete(Long id) {
        def vendorRegisterInstance = VendorRegister.get(id)
        if (!vendorRegisterInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), id])
            redirect(action: "list")
            return
        }

        try {
            vendorRegisterInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vendorRegister.label', default: 'VendorRegister'), id])
            redirect(action: "show", id: id)
        }
    }
}
