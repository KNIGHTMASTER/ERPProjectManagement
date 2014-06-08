package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationDelayController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationDelayInstanceList: IdentificationDelay.list(params), identificationDelayInstanceTotal: IdentificationDelay.count()]
    }

    def create() {
        [identificationDelayInstance: new IdentificationDelay(params)]
    }

    def save() {
        def identificationDelayInstance = new IdentificationDelay(params)
        if (!identificationDelayInstance.save(flush: true)) {
            render(view: "create", model: [identificationDelayInstance: identificationDelayInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), identificationDelayInstance.id])
        redirect(action: "show", id: identificationDelayInstance.id)
    }

    def show(Long id) {
        def identificationDelayInstance = IdentificationDelay.get(id)
        if (!identificationDelayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), id])
            redirect(action: "list")
            return
        }

        [identificationDelayInstance: identificationDelayInstance]
    }

    def edit(Long id) {
        def identificationDelayInstance = IdentificationDelay.get(id)
        if (!identificationDelayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), id])
            redirect(action: "list")
            return
        }

        [identificationDelayInstance: identificationDelayInstance]
    }

    def update(Long id, Long version) {
        def identificationDelayInstance = IdentificationDelay.get(id)
        if (!identificationDelayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationDelayInstance.version > version) {
                identificationDelayInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationDelay.label', default: 'IdentificationDelay')] as Object[],
                          "Another user has updated this IdentificationDelay while you were editing")
                render(view: "edit", model: [identificationDelayInstance: identificationDelayInstance])
                return
            }
        }

        identificationDelayInstance.properties = params

        if (!identificationDelayInstance.save(flush: true)) {
            render(view: "edit", model: [identificationDelayInstance: identificationDelayInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), identificationDelayInstance.id])
        redirect(action: "show", id: identificationDelayInstance.id)
    }

    def delete(Long id) {
        def identificationDelayInstance = IdentificationDelay.get(id)
        if (!identificationDelayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationDelayInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationDelay.label', default: 'IdentificationDelay'), id])
            redirect(action: "show", id: id)
        }
    }
}
