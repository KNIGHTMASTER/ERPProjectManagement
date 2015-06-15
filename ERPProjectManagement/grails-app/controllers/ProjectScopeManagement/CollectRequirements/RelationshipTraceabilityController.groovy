package ProjectScopeManagement.CollectRequirements

import org.springframework.dao.DataIntegrityViolationException

class RelationshipTraceabilityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [relationshipTraceabilityInstanceList: RelationshipTraceability.list(params), relationshipTraceabilityInstanceTotal: RelationshipTraceability.count()]
    }

    def create() {
        [relationshipTraceabilityInstance: new RelationshipTraceability(params)]
    }

    def save() {
        def relationshipTraceabilityInstance = new RelationshipTraceability(params)
        if (!relationshipTraceabilityInstance.save(flush: true)) {
            render(view: "create", model: [relationshipTraceabilityInstance: relationshipTraceabilityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), relationshipTraceabilityInstance.id])
        redirect(action: "show", id: relationshipTraceabilityInstance.id)
    }

    def show(Long id) {
        def relationshipTraceabilityInstance = RelationshipTraceability.get(id)
        if (!relationshipTraceabilityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), id])
            redirect(action: "list")
            return
        }

        [relationshipTraceabilityInstance: relationshipTraceabilityInstance]
    }

    def edit(Long id) {
        def relationshipTraceabilityInstance = RelationshipTraceability.get(id)
        if (!relationshipTraceabilityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), id])
            redirect(action: "list")
            return
        }

        [relationshipTraceabilityInstance: relationshipTraceabilityInstance]
    }

    def update(Long id, Long version) {
        def relationshipTraceabilityInstance = RelationshipTraceability.get(id)
        if (!relationshipTraceabilityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (relationshipTraceabilityInstance.version > version) {
                relationshipTraceabilityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability')] as Object[],
                          "Another user has updated this RelationshipTraceability while you were editing")
                render(view: "edit", model: [relationshipTraceabilityInstance: relationshipTraceabilityInstance])
                return
            }
        }

        relationshipTraceabilityInstance.properties = params

        if (!relationshipTraceabilityInstance.save(flush: true)) {
            render(view: "edit", model: [relationshipTraceabilityInstance: relationshipTraceabilityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), relationshipTraceabilityInstance.id])
        redirect(action: "show", id: relationshipTraceabilityInstance.id)
    }

    def delete(Long id) {
        def relationshipTraceabilityInstance = RelationshipTraceability.get(id)
        if (!relationshipTraceabilityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), id])
            redirect(action: "list")
            return
        }

        try {
            relationshipTraceabilityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability'), id])
            redirect(action: "show", id: id)
        }
    }
}
