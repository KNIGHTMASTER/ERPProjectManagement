package WebPage
import grails.plugins.springsecurity.Secured;
import org.springframework.dao.DataIntegrityViolationException

class ProcurementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [procurementInstanceList: Procurement.list(params), procurementInstanceTotal: Procurement.count()]
    }

    def create() {
        [procurementInstance: new Procurement(params)]
    }

    def save() {
        def procurementInstance = new Procurement(params)
        if (!procurementInstance.save(flush: true)) {
            render(view: "create", model: [procurementInstance: procurementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'procurement.label', default: 'Procurement'), procurementInstance.id])
        redirect(action: "show", id: procurementInstance.id)
    }

    def show(Long id) {
        def procurementInstance = Procurement.get(id)
        if (!procurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurement.label', default: 'Procurement'), id])
            redirect(action: "list")
            return
        }

        [procurementInstance: procurementInstance]
    }

    def edit(Long id) {
        def procurementInstance = Procurement.get(id)
        if (!procurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurement.label', default: 'Procurement'), id])
            redirect(action: "list")
            return
        }

        [procurementInstance: procurementInstance]
    }

    def update(Long id, Long version) {
        def procurementInstance = Procurement.get(id)
        if (!procurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurement.label', default: 'Procurement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (procurementInstance.version > version) {
                procurementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'procurement.label', default: 'Procurement')] as Object[],
                          "Another user has updated this Procurement while you were editing")
                render(view: "edit", model: [procurementInstance: procurementInstance])
                return
            }
        }

        procurementInstance.properties = params

        if (!procurementInstance.save(flush: true)) {
            render(view: "edit", model: [procurementInstance: procurementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'procurement.label', default: 'Procurement'), procurementInstance.id])
        redirect(action: "show", id: procurementInstance.id)
    }

    def delete(Long id) {
        def procurementInstance = Procurement.get(id)
        if (!procurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'procurement.label', default: 'Procurement'), id])
            redirect(action: "list")
            return
        }

        try {
            procurementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'procurement.label', default: 'Procurement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'procurement.label', default: 'Procurement'), id])
            redirect(action: "show", id: id)
        }
    }
}
