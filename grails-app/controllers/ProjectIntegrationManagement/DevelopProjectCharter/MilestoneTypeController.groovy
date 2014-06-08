package ProjectIntegrationManagement.DevelopProjectCharter

import org.springframework.dao.DataIntegrityViolationException

class MilestoneTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [milestoneTypeInstanceList: MilestoneType.list(params), milestoneTypeInstanceTotal: MilestoneType.count()]
    }

    def create() {
        [milestoneTypeInstance: new MilestoneType(params)]
    }

    def save() {
        def milestoneTypeInstance = new MilestoneType(params)
        if (!milestoneTypeInstance.save(flush: true)) {
            render(view: "create", model: [milestoneTypeInstance: milestoneTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), milestoneTypeInstance.id])
        redirect(action: "show", id: milestoneTypeInstance.id)
    }

    def show(Long id) {
        def milestoneTypeInstance = MilestoneType.get(id)
        if (!milestoneTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), id])
            redirect(action: "list")
            return
        }

        [milestoneTypeInstance: milestoneTypeInstance]
    }

    def edit(Long id) {
        def milestoneTypeInstance = MilestoneType.get(id)
        if (!milestoneTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), id])
            redirect(action: "list")
            return
        }

        [milestoneTypeInstance: milestoneTypeInstance]
    }

    def update(Long id, Long version) {
        def milestoneTypeInstance = MilestoneType.get(id)
        if (!milestoneTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (milestoneTypeInstance.version > version) {
                milestoneTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'milestoneType.label', default: 'MilestoneType')] as Object[],
                          "Another user has updated this MilestoneType while you were editing")
                render(view: "edit", model: [milestoneTypeInstance: milestoneTypeInstance])
                return
            }
        }

        milestoneTypeInstance.properties = params

        if (!milestoneTypeInstance.save(flush: true)) {
            render(view: "edit", model: [milestoneTypeInstance: milestoneTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), milestoneTypeInstance.id])
        redirect(action: "show", id: milestoneTypeInstance.id)
    }

    def delete(Long id) {
        def milestoneTypeInstance = MilestoneType.get(id)
        if (!milestoneTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), id])
            redirect(action: "list")
            return
        }

        try {
            milestoneTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'milestoneType.label', default: 'MilestoneType'), id])
            redirect(action: "show", id: id)
        }
    }
}
