package ProjectProcurementManagement.AdministerProcurements

import org.springframework.dao.DataIntegrityViolationException

class PerformanceVendorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [performanceVendorInstanceList: PerformanceVendor.list(params), performanceVendorInstanceTotal: PerformanceVendor.count()]
    }

    def create() {
        [performanceVendorInstance: new PerformanceVendor(params)]
    }

    def save() {
        def performanceVendorInstance = new PerformanceVendor(params)
        if (!performanceVendorInstance.save(flush: true)) {
            render(view: "create", model: [performanceVendorInstance: performanceVendorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), performanceVendorInstance.id])
        redirect(action: "show", id: performanceVendorInstance.id)
    }

    def show(Long id) {
        def performanceVendorInstance = PerformanceVendor.get(id)
        if (!performanceVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), id])
            redirect(action: "list")
            return
        }

        [performanceVendorInstance: performanceVendorInstance]
    }

    def edit(Long id) {
        def performanceVendorInstance = PerformanceVendor.get(id)
        if (!performanceVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), id])
            redirect(action: "list")
            return
        }

        [performanceVendorInstance: performanceVendorInstance]
    }

    def update(Long id, Long version) {
        def performanceVendorInstance = PerformanceVendor.get(id)
        if (!performanceVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (performanceVendorInstance.version > version) {
                performanceVendorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'performanceVendor.label', default: 'PerformanceVendor')] as Object[],
                          "Another user has updated this PerformanceVendor while you were editing")
                render(view: "edit", model: [performanceVendorInstance: performanceVendorInstance])
                return
            }
        }

        performanceVendorInstance.properties = params

        if (!performanceVendorInstance.save(flush: true)) {
            render(view: "edit", model: [performanceVendorInstance: performanceVendorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), performanceVendorInstance.id])
        redirect(action: "show", id: performanceVendorInstance.id)
    }

    def delete(Long id) {
        def performanceVendorInstance = PerformanceVendor.get(id)
        if (!performanceVendorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), id])
            redirect(action: "list")
            return
        }

        try {
            performanceVendorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'performanceVendor.label', default: 'PerformanceVendor'), id])
            redirect(action: "show", id: id)
        }
    }
}
