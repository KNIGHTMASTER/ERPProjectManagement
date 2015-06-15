package ProjectTimeManagement.DevelopSchedule

import org.springframework.dao.DataIntegrityViolationException

class TimeApprovalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [timeApprovalInstanceList: TimeApproval.list(params), timeApprovalInstanceTotal: TimeApproval.count()]
    }

    def create() {
        [timeApprovalInstance: new TimeApproval(params)]
    }

    def save() {
        def timeApprovalInstance = new TimeApproval(params)
        if (!timeApprovalInstance.save(flush: true)) {
            render(view: "create", model: [timeApprovalInstance: timeApprovalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), timeApprovalInstance.id])
        redirect(action: "show", id: timeApprovalInstance.id)
    }

    def show(Long id) {
        def timeApprovalInstance = TimeApproval.get(id)
        if (!timeApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), id])
            redirect(action: "list")
            return
        }

        [timeApprovalInstance: timeApprovalInstance]
    }

    def edit(Long id) {
        def timeApprovalInstance = TimeApproval.get(id)
        if (!timeApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), id])
            redirect(action: "list")
            return
        }

        [timeApprovalInstance: timeApprovalInstance]
    }

    def update(Long id, Long version) {
        def timeApprovalInstance = TimeApproval.get(id)
        if (!timeApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (timeApprovalInstance.version > version) {
                timeApprovalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'timeApproval.label', default: 'TimeApproval')] as Object[],
                          "Another user has updated this TimeApproval while you were editing")
                render(view: "edit", model: [timeApprovalInstance: timeApprovalInstance])
                return
            }
        }

        timeApprovalInstance.properties = params

        if (!timeApprovalInstance.save(flush: true)) {
            render(view: "edit", model: [timeApprovalInstance: timeApprovalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), timeApprovalInstance.id])
        redirect(action: "show", id: timeApprovalInstance.id)
    }

    def delete(Long id) {
        def timeApprovalInstance = TimeApproval.get(id)
        if (!timeApprovalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), id])
            redirect(action: "list")
            return
        }

        try {
            timeApprovalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'timeApproval.label', default: 'TimeApproval'), id])
            redirect(action: "show", id: id)
        }
    }
}
