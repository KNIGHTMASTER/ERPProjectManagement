package ProjectIntegrationManagement.MonitoringAndControllingProjectWork

import org.springframework.dao.DataIntegrityViolationException

class InternalProcessController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [internalProcessInstanceList: InternalProcess.list(params), internalProcessInstanceTotal: InternalProcess.count()]
    }

    def create() {
        [internalProcessInstance: new InternalProcess(params)]
    }

    def save() {
        def internalProcessInstance = new InternalProcess(params)
        if (!internalProcessInstance.save(flush: true)) {
            render(view: "create", model: [internalProcessInstance: internalProcessInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), internalProcessInstance.id])
        redirect(action: "show", id: internalProcessInstance.id)
    }

    def show(Long id) {
        def internalProcessInstance = InternalProcess.get(id)
        if (!internalProcessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), id])
            redirect(action: "list")
            return
        }

        [internalProcessInstance: internalProcessInstance]
    }

    def edit(Long id) {
        def internalProcessInstance = InternalProcess.get(id)
        if (!internalProcessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), id])
            redirect(action: "list")
            return
        }

        [internalProcessInstance: internalProcessInstance]
    }

    def update(Long id, Long version) {
        def internalProcessInstance = InternalProcess.get(id)
        if (!internalProcessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (internalProcessInstance.version > version) {
                internalProcessInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'internalProcess.label', default: 'InternalProcess')] as Object[],
                          "Another user has updated this InternalProcess while you were editing")
                render(view: "edit", model: [internalProcessInstance: internalProcessInstance])
                return
            }
        }

        internalProcessInstance.properties = params

        if (!internalProcessInstance.save(flush: true)) {
            render(view: "edit", model: [internalProcessInstance: internalProcessInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), internalProcessInstance.id])
        redirect(action: "show", id: internalProcessInstance.id)
    }

    def delete(Long id) {
        def internalProcessInstance = InternalProcess.get(id)
        if (!internalProcessInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), id])
            redirect(action: "list")
            return
        }

        try {
            internalProcessInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'internalProcess.label', default: 'InternalProcess'), id])
            redirect(action: "show", id: id)
        }
    }
}
