package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class TaskSOWController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [taskSOWInstanceList: TaskSOW.list(params), taskSOWInstanceTotal: TaskSOW.count()]
    }

    def create() {
        [taskSOWInstance: new TaskSOW(params)]
    }

    def save() {
        def taskSOWInstance = new TaskSOW(params)
        if (!taskSOWInstance.save(flush: true)) {
            render(view: "create", model: [taskSOWInstance: taskSOWInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), taskSOWInstance.id])
        redirect(action: "show", id: taskSOWInstance.id)
    }

    def show(Long id) {
        def taskSOWInstance = TaskSOW.get(id)
        if (!taskSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), id])
            redirect(action: "list")
            return
        }

        [taskSOWInstance: taskSOWInstance]
    }

    def edit(Long id) {
        def taskSOWInstance = TaskSOW.get(id)
        if (!taskSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), id])
            redirect(action: "list")
            return
        }

        [taskSOWInstance: taskSOWInstance]
    }

    def update(Long id, Long version) {
        def taskSOWInstance = TaskSOW.get(id)
        if (!taskSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (taskSOWInstance.version > version) {
                taskSOWInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'taskSOW.label', default: 'TaskSOW')] as Object[],
                          "Another user has updated this TaskSOW while you were editing")
                render(view: "edit", model: [taskSOWInstance: taskSOWInstance])
                return
            }
        }

        taskSOWInstance.properties = params

        if (!taskSOWInstance.save(flush: true)) {
            render(view: "edit", model: [taskSOWInstance: taskSOWInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), taskSOWInstance.id])
        redirect(action: "show", id: taskSOWInstance.id)
    }

    def delete(Long id) {
        def taskSOWInstance = TaskSOW.get(id)
        if (!taskSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), id])
            redirect(action: "list")
            return
        }

        try {
            taskSOWInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'taskSOW.label', default: 'TaskSOW'), id])
            redirect(action: "show", id: id)
        }
    }
}
