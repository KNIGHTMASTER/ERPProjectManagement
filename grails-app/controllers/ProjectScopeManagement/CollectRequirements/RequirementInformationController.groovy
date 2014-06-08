package ProjectScopeManagement.CollectRequirements

import org.springframework.dao.DataIntegrityViolationException

class RequirementInformationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requirementInformationInstanceList: RequirementInformation.list(params), requirementInformationInstanceTotal: RequirementInformation.count()]
    }

    def create() {
        [requirementInformationInstance: new RequirementInformation(params)]
    }

    def save() {
        def requirementInformationInstance = new RequirementInformation(params)
        if (!requirementInformationInstance.save(flush: true)) {
            render(view: "create", model: [requirementInformationInstance: requirementInformationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), requirementInformationInstance.id])
        redirect(action: "show", id: requirementInformationInstance.id)
    }

    def show(Long id) {
        def requirementInformationInstance = RequirementInformation.get(id)
        if (!requirementInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), id])
            redirect(action: "list")
            return
        }

        [requirementInformationInstance: requirementInformationInstance]
    }

    def edit(Long id) {
        def requirementInformationInstance = RequirementInformation.get(id)
        if (!requirementInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), id])
            redirect(action: "list")
            return
        }

        [requirementInformationInstance: requirementInformationInstance]
    }

    def update(Long id, Long version) {
        def requirementInformationInstance = RequirementInformation.get(id)
        if (!requirementInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requirementInformationInstance.version > version) {
                requirementInformationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requirementInformation.label', default: 'RequirementInformation')] as Object[],
                          "Another user has updated this RequirementInformation while you were editing")
                render(view: "edit", model: [requirementInformationInstance: requirementInformationInstance])
                return
            }
        }

        requirementInformationInstance.properties = params

        if (!requirementInformationInstance.save(flush: true)) {
            render(view: "edit", model: [requirementInformationInstance: requirementInformationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), requirementInformationInstance.id])
        redirect(action: "show", id: requirementInformationInstance.id)
    }

    def delete(Long id) {
        def requirementInformationInstance = RequirementInformation.get(id)
        if (!requirementInformationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), id])
            redirect(action: "list")
            return
        }

        try {
            requirementInformationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation'), id])
            redirect(action: "show", id: id)
        }
    }
}
