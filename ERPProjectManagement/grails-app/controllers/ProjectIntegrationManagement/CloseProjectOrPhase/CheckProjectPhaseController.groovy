package ProjectIntegrationManagement.CloseProjectOrPhase

import org.springframework.dao.DataIntegrityViolationException

class CheckProjectPhaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [checkProjectPhaseInstanceList: CheckProjectPhase.list(params), checkProjectPhaseInstanceTotal: CheckProjectPhase.count()]
    }

    def create() {
        [checkProjectPhaseInstance: new CheckProjectPhase(params)]
    }

    def save() {
        def checkProjectPhaseInstance = new CheckProjectPhase(params)
        if (!checkProjectPhaseInstance.save(flush: true)) {
            render(view: "create", model: [checkProjectPhaseInstance: checkProjectPhaseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), checkProjectPhaseInstance.id])
        redirect(action: "show", id: checkProjectPhaseInstance.id)
    }

    def show(Long id) {
        def checkProjectPhaseInstance = CheckProjectPhase.get(id)
        if (!checkProjectPhaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), id])
            redirect(action: "list")
            return
        }

        [checkProjectPhaseInstance: checkProjectPhaseInstance]
    }

    def edit(Long id) {
        def checkProjectPhaseInstance = CheckProjectPhase.get(id)
        if (!checkProjectPhaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), id])
            redirect(action: "list")
            return
        }

        [checkProjectPhaseInstance: checkProjectPhaseInstance]
    }

    def update(Long id, Long version) {
        def checkProjectPhaseInstance = CheckProjectPhase.get(id)
        if (!checkProjectPhaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (checkProjectPhaseInstance.version > version) {
                checkProjectPhaseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase')] as Object[],
                          "Another user has updated this CheckProjectPhase while you were editing")
                render(view: "edit", model: [checkProjectPhaseInstance: checkProjectPhaseInstance])
                return
            }
        }

        checkProjectPhaseInstance.properties = params

        if (!checkProjectPhaseInstance.save(flush: true)) {
            render(view: "edit", model: [checkProjectPhaseInstance: checkProjectPhaseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), checkProjectPhaseInstance.id])
        redirect(action: "show", id: checkProjectPhaseInstance.id)
    }

    def delete(Long id) {
        def checkProjectPhaseInstance = CheckProjectPhase.get(id)
        if (!checkProjectPhaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), id])
            redirect(action: "list")
            return
        }

        try {
            checkProjectPhaseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase'), id])
            redirect(action: "show", id: id)
        }
    }
}
