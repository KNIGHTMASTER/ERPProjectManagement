package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class SubCategoriesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subCategoriesInstanceList: SubCategories.list(params), subCategoriesInstanceTotal: SubCategories.count()]
    }

    def create() {
        [subCategoriesInstance: new SubCategories(params)]
    }

    def save() {
        def subCategoriesInstance = new SubCategories(params)
        if (!subCategoriesInstance.save(flush: true)) {
            render(view: "create", model: [subCategoriesInstance: subCategoriesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), subCategoriesInstance.id])
        redirect(action: "show", id: subCategoriesInstance.id)
    }

    def show(Long id) {
        def subCategoriesInstance = SubCategories.get(id)
        if (!subCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), id])
            redirect(action: "list")
            return
        }

        [subCategoriesInstance: subCategoriesInstance]
    }

    def edit(Long id) {
        def subCategoriesInstance = SubCategories.get(id)
        if (!subCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), id])
            redirect(action: "list")
            return
        }

        [subCategoriesInstance: subCategoriesInstance]
    }

    def update(Long id, Long version) {
        def subCategoriesInstance = SubCategories.get(id)
        if (!subCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subCategoriesInstance.version > version) {
                subCategoriesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subCategories.label', default: 'SubCategories')] as Object[],
                          "Another user has updated this SubCategories while you were editing")
                render(view: "edit", model: [subCategoriesInstance: subCategoriesInstance])
                return
            }
        }

        subCategoriesInstance.properties = params

        if (!subCategoriesInstance.save(flush: true)) {
            render(view: "edit", model: [subCategoriesInstance: subCategoriesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), subCategoriesInstance.id])
        redirect(action: "show", id: subCategoriesInstance.id)
    }

    def delete(Long id) {
        def subCategoriesInstance = SubCategories.get(id)
        if (!subCategoriesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), id])
            redirect(action: "list")
            return
        }

        try {
            subCategoriesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subCategories.label', default: 'SubCategories'), id])
            redirect(action: "show", id: id)
        }
    }
}
