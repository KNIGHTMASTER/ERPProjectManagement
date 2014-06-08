package WebPage
import grails.plugins.springsecurity.Secured;
import org.springframework.dao.DataIntegrityViolationException

class RiskManagementController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [riskManagementInstanceList: RiskManagement.list(params), riskManagementInstanceTotal: RiskManagement.count()]
    }
    def create() {
        [riskManagementInstance: new RiskManagement(params)]
    }

    def save() {
        def riskManagementInstance = new RiskManagement(params)
        if (!riskManagementInstance.save(flush: true)) {
            render(view: "create", model: [riskManagementInstance: riskManagementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), riskManagementInstance.id])
        redirect(action: "show", id: riskManagementInstance.id)
    }

    def show(Long id) {
        def riskManagementInstance = RiskManagement.get(id)
        if (!riskManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), id])
            redirect(action: "list")
            return
        }

        [riskManagementInstance: riskManagementInstance]
    }

    def edit(Long id) {
        def riskManagementInstance = RiskManagement.get(id)
        if (!riskManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), id])
            redirect(action: "list")
            return
        }

        [riskManagementInstance: riskManagementInstance]
    }

    def update(Long id, Long version) {
        def riskManagementInstance = RiskManagement.get(id)
        if (!riskManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (riskManagementInstance.version > version) {
                riskManagementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'riskManagement.label', default: 'RiskManagement')] as Object[],
                          "Another user has updated this RiskManagement while you were editing")
                render(view: "edit", model: [riskManagementInstance: riskManagementInstance])
                return
            }
        }

        riskManagementInstance.properties = params

        if (!riskManagementInstance.save(flush: true)) {
            render(view: "edit", model: [riskManagementInstance: riskManagementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), riskManagementInstance.id])
        redirect(action: "show", id: riskManagementInstance.id)
    }

    def delete(Long id) {
        def riskManagementInstance = RiskManagement.get(id)
        if (!riskManagementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), id])
            redirect(action: "list")
            return
        }

        try {
            riskManagementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'riskManagement.label', default: 'RiskManagement'), id])
            redirect(action: "show", id: id)
        }
    }
}
