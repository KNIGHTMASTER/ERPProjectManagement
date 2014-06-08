package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class MilestoneSOWController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [milestoneSOWInstanceList: MilestoneSOW.list(params), milestoneSOWInstanceTotal: MilestoneSOW.count()]
    }

    def create() {
        [milestoneSOWInstance: new MilestoneSOW(params)]
    }

    def save() {
        def milestoneSOWInstance = new MilestoneSOW(params)
        if (!milestoneSOWInstance.save(flush: true)) {
            render(view: "create", model: [milestoneSOWInstance: milestoneSOWInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), milestoneSOWInstance.id])
        redirect(action: "show", id: milestoneSOWInstance.id)
    }

    def show(Long id) {
        def milestoneSOWInstance = MilestoneSOW.get(id)
        if (!milestoneSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), id])
            redirect(action: "list")
            return
        }

        [milestoneSOWInstance: milestoneSOWInstance]
    }

    def edit(Long id) {
        def milestoneSOWInstance = MilestoneSOW.get(id)
        if (!milestoneSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), id])
            redirect(action: "list")
            return
        }

        [milestoneSOWInstance: milestoneSOWInstance]
    }

    def update(Long id, Long version) {
        def milestoneSOWInstance = MilestoneSOW.get(id)
        if (!milestoneSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (milestoneSOWInstance.version > version) {
                milestoneSOWInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'milestoneSOW.label', default: 'MilestoneSOW')] as Object[],
                          "Another user has updated this MilestoneSOW while you were editing")
                render(view: "edit", model: [milestoneSOWInstance: milestoneSOWInstance])
                return
            }
        }

        milestoneSOWInstance.properties = params

        if (!milestoneSOWInstance.save(flush: true)) {
            render(view: "edit", model: [milestoneSOWInstance: milestoneSOWInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), milestoneSOWInstance.id])
        redirect(action: "show", id: milestoneSOWInstance.id)
    }

    def delete(Long id) {
        def milestoneSOWInstance = MilestoneSOW.get(id)
        if (!milestoneSOWInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), id])
            redirect(action: "list")
            return
        }

        try {
            milestoneSOWInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'milestoneSOW.label', default: 'MilestoneSOW'), id])
            redirect(action: "show", id: id)
        }
    }
}
