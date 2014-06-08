package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class RiskCategoriesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [riskCategoriesInstanceList: RiskCategories.list(params), riskCategoriesInstanceTotal: RiskCategories.count()]
    }

    def create() {
        [riskCategoriesInstance: new RiskCategories(params)]
    }

    def save() {
        def riskCategoriesInstance = new RiskCategories(params)
        if (!riskCategoriesInstance.save(flush: true)) {
            render(view: "create", model: [riskCategoriesInstance: riskCategoriesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), riskCategoriesInstance.id])
        redirect(action: "show", id: riskCategoriesInstance.id)
    }

    def show(Long id) {
        def riskCategoriesInstance = RiskCategories.get(id)
        if (!riskCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), id])
            redirect(action: "list")
            return
        }

        [riskCategoriesInstance: riskCategoriesInstance]
    }

    def edit(Long id) {
        def riskCategoriesInstance = RiskCategories.get(id)
        if (!riskCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), id])
            redirect(action: "list")
            return
        }

        [riskCategoriesInstance: riskCategoriesInstance]
    }

    def update(Long id, Long version) {
        def riskCategoriesInstance = RiskCategories.get(id)
        if (!riskCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (riskCategoriesInstance.version > version) {
                riskCategoriesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'riskCategories.label', default: 'RiskCategories')] as Object[],
                          "Another user has updated this RiskCategories while you were editing")
                render(view: "edit", model: [riskCategoriesInstance: riskCategoriesInstance])
                return
            }
        }

        riskCategoriesInstance.properties = params

        if (!riskCategoriesInstance.save(flush: true)) {
            render(view: "edit", model: [riskCategoriesInstance: riskCategoriesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), riskCategoriesInstance.id])
        redirect(action: "show", id: riskCategoriesInstance.id)
    }

    def delete(Long id) {
        def riskCategoriesInstance = RiskCategories.get(id)
        if (!riskCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), id])
            redirect(action: "list")
            return
        }

        try {
            riskCategoriesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'riskCategories.label', default: 'RiskCategories'), id])
            redirect(action: "show", id: id)
        }
    }
}
