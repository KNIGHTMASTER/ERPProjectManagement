package ProjectScopeManagement.VerifyScope

import org.springframework.dao.DataIntegrityViolationException

class AcceptedDeliverableController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [acceptedDeliverableInstanceList: AcceptedDeliverable.list(params), acceptedDeliverableInstanceTotal: AcceptedDeliverable.count()]
    }

    def create() {
        [acceptedDeliverableInstance: new AcceptedDeliverable(params)]
    }

    def save() {
        def acceptedDeliverableInstance = new AcceptedDeliverable(params)
        if (!acceptedDeliverableInstance.save(flush: true)) {
            render(view: "create", model: [acceptedDeliverableInstance: acceptedDeliverableInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), acceptedDeliverableInstance.id])
        redirect(action: "show", id: acceptedDeliverableInstance.id)
    }

    def show(Long id) {
        def acceptedDeliverableInstance = AcceptedDeliverable.get(id)
        if (!acceptedDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), id])
            redirect(action: "list")
            return
        }

        [acceptedDeliverableInstance: acceptedDeliverableInstance]
    }

    def edit(Long id) {
        def acceptedDeliverableInstance = AcceptedDeliverable.get(id)
        if (!acceptedDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), id])
            redirect(action: "list")
            return
        }

        [acceptedDeliverableInstance: acceptedDeliverableInstance]
    }

    def update(Long id, Long version) {
        def acceptedDeliverableInstance = AcceptedDeliverable.get(id)
        if (!acceptedDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (acceptedDeliverableInstance.version > version) {
                acceptedDeliverableInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable')] as Object[],
                          "Another user has updated this AcceptedDeliverable while you were editing")
                render(view: "edit", model: [acceptedDeliverableInstance: acceptedDeliverableInstance])
                return
            }
        }

        acceptedDeliverableInstance.properties = params

        if (!acceptedDeliverableInstance.save(flush: true)) {
            render(view: "edit", model: [acceptedDeliverableInstance: acceptedDeliverableInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), acceptedDeliverableInstance.id])
        redirect(action: "show", id: acceptedDeliverableInstance.id)
    }

    def delete(Long id) {
        def acceptedDeliverableInstance = AcceptedDeliverable.get(id)
        if (!acceptedDeliverableInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), id])
            redirect(action: "list")
            return
        }

        try {
            acceptedDeliverableInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'acceptedDeliverable.label', default: 'AcceptedDeliverable'), id])
            redirect(action: "show", id: id)
        }
    }
}
