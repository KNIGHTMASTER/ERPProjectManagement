package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class Finance3Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [finance3InstanceList: Finance3.list(params), finance3InstanceTotal: Finance3.count()]
    }

    def create() {
        [finance3Instance: new Finance3(params)]
    }

    def save() {
        def finance3Instance = new Finance3(params)
        if (!finance3Instance.save(flush: true)) {
            render(view: "create", model: [finance3Instance: finance3Instance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'finance3.label', default: 'Finance3'), finance3Instance.id])
        redirect(action: "show", id: finance3Instance.id)
    }

    def show(Long id) {
        def finance3Instance = Finance3.get(id)
        if (!finance3Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'finance3.label', default: 'Finance3'), id])
            redirect(action: "list")
            return
        }

        [finance3Instance: finance3Instance]
    }

    def edit(Long id) {
        def finance3Instance = Finance3.get(id)
        if (!finance3Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'finance3.label', default: 'Finance3'), id])
            redirect(action: "list")
            return
        }

        [finance3Instance: finance3Instance]
    }

    def update(Long id, Long version) {
        def finance3Instance = Finance3.get(id)
        if (!finance3Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'finance3.label', default: 'Finance3'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (finance3Instance.version > version) {
                finance3Instance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'finance3.label', default: 'Finance3')] as Object[],
                          "Another user has updated this Finance3 while you were editing")
                render(view: "edit", model: [finance3Instance: finance3Instance])
                return
            }
        }

        finance3Instance.properties = params

        if (!finance3Instance.save(flush: true)) {
            render(view: "edit", model: [finance3Instance: finance3Instance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'finance3.label', default: 'Finance3'), finance3Instance.id])
        redirect(action: "show", id: finance3Instance.id)
    }

    def delete(Long id) {
        def finance3Instance = Finance3.get(id)
        if (!finance3Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'finance3.label', default: 'Finance3'), id])
            redirect(action: "list")
            return
        }

        try {
            finance3Instance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'finance3.label', default: 'Finance3'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'finance3.label', default: 'Finance3'), id])
            redirect(action: "show", id: id)
        }
    }
}
