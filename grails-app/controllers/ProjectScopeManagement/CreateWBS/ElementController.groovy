package ProjectScopeManagement.CreateWBS

import org.springframework.dao.DataIntegrityViolationException

class ElementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [elementInstanceList: Element.list(params), elementInstanceTotal: Element.count()]
    }

    def create() {
        [elementInstance: new Element(params)]
    }

    def save() {
        def elementInstance = new Element(params)
        if (!elementInstance.save(flush: true)) {
            render(view: "create", model: [elementInstance: elementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'element.label', default: 'Element'), elementInstance.id])
        redirect(action: "show", id: elementInstance.id)
    }

    def show(Long id) {
        def elementInstance = Element.get(id)
        if (!elementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), id])
            redirect(action: "list")
            return
        }

        [elementInstance: elementInstance]
    }

    def edit(Long id) {
        def elementInstance = Element.get(id)
        if (!elementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), id])
            redirect(action: "list")
            return
        }

        [elementInstance: elementInstance]
    }

    def update(Long id, Long version) {
        def elementInstance = Element.get(id)
        if (!elementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (elementInstance.version > version) {
                elementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'element.label', default: 'Element')] as Object[],
                          "Another user has updated this Element while you were editing")
                render(view: "edit", model: [elementInstance: elementInstance])
                return
            }
        }

        elementInstance.properties = params

        if (!elementInstance.save(flush: true)) {
            render(view: "edit", model: [elementInstance: elementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'element.label', default: 'Element'), elementInstance.id])
        redirect(action: "show", id: elementInstance.id)
    }

    def delete(Long id) {
        def elementInstance = Element.get(id)
        if (!elementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), id])
            redirect(action: "list")
            return
        }

        try {
            elementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'element.label', default: 'Element'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'element.label', default: 'Element'), id])
            redirect(action: "show", id: id)
        }
    }
}
