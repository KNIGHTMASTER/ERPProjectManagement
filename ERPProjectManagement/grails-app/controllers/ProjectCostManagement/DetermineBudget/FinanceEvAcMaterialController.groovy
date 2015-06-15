package ProjectCostManagement.DetermineBudget

import org.springframework.dao.DataIntegrityViolationException

class FinanceEvAcMaterialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [financeEvAcMaterialInstanceList: FinanceEvAcMaterial.list(params), financeEvAcMaterialInstanceTotal: FinanceEvAcMaterial.count()]
    }

    def create() {
        [financeEvAcMaterialInstance: new FinanceEvAcMaterial(params)]
    }

    def save() {
        def financeEvAcMaterialInstance = new FinanceEvAcMaterial(params)
        if (!financeEvAcMaterialInstance.save(flush: true)) {
            render(view: "create", model: [financeEvAcMaterialInstance: financeEvAcMaterialInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), financeEvAcMaterialInstance.id])
        redirect(action: "show", id: financeEvAcMaterialInstance.id)
    }

    def show(Long id) {
        def financeEvAcMaterialInstance = FinanceEvAcMaterial.get(id)
        if (!financeEvAcMaterialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), id])
            redirect(action: "list")
            return
        }

        [financeEvAcMaterialInstance: financeEvAcMaterialInstance]
    }

    def edit(Long id) {
        def financeEvAcMaterialInstance = FinanceEvAcMaterial.get(id)
        if (!financeEvAcMaterialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), id])
            redirect(action: "list")
            return
        }

        [financeEvAcMaterialInstance: financeEvAcMaterialInstance]
    }

    def update(Long id, Long version) {
        def financeEvAcMaterialInstance = FinanceEvAcMaterial.get(id)
        if (!financeEvAcMaterialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (financeEvAcMaterialInstance.version > version) {
                financeEvAcMaterialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial')] as Object[],
                          "Another user has updated this FinanceEvAcMaterial while you were editing")
                render(view: "edit", model: [financeEvAcMaterialInstance: financeEvAcMaterialInstance])
                return
            }
        }

        financeEvAcMaterialInstance.properties = params

        if (!financeEvAcMaterialInstance.save(flush: true)) {
            render(view: "edit", model: [financeEvAcMaterialInstance: financeEvAcMaterialInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), financeEvAcMaterialInstance.id])
        redirect(action: "show", id: financeEvAcMaterialInstance.id)
    }

    def delete(Long id) {
        def financeEvAcMaterialInstance = FinanceEvAcMaterial.get(id)
        if (!financeEvAcMaterialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), id])
            redirect(action: "list")
            return
        }

        try {
            financeEvAcMaterialInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial'), id])
            redirect(action: "show", id: id)
        }
    }
}
