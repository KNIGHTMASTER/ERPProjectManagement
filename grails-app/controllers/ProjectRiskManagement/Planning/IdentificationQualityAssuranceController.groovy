package ProjectRiskManagement.Planning

import org.springframework.dao.DataIntegrityViolationException

class IdentificationQualityAssuranceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [identificationQualityAssuranceInstanceList: IdentificationQualityAssurance.list(params), identificationQualityAssuranceInstanceTotal: IdentificationQualityAssurance.count()]
    }

    def create() {
        [identificationQualityAssuranceInstance: new IdentificationQualityAssurance(params)]
    }

    def save() {
        def identificationQualityAssuranceInstance = new IdentificationQualityAssurance(params)
        if (!identificationQualityAssuranceInstance.save(flush: true)) {
            render(view: "create", model: [identificationQualityAssuranceInstance: identificationQualityAssuranceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), identificationQualityAssuranceInstance.id])
        redirect(action: "show", id: identificationQualityAssuranceInstance.id)
    }

    def show(Long id) {
        def identificationQualityAssuranceInstance = IdentificationQualityAssurance.get(id)
        if (!identificationQualityAssuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), id])
            redirect(action: "list")
            return
        }

        [identificationQualityAssuranceInstance: identificationQualityAssuranceInstance]
    }

    def edit(Long id) {
        def identificationQualityAssuranceInstance = IdentificationQualityAssurance.get(id)
        if (!identificationQualityAssuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), id])
            redirect(action: "list")
            return
        }

        [identificationQualityAssuranceInstance: identificationQualityAssuranceInstance]
    }

    def update(Long id, Long version) {
        def identificationQualityAssuranceInstance = IdentificationQualityAssurance.get(id)
        if (!identificationQualityAssuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (identificationQualityAssuranceInstance.version > version) {
                identificationQualityAssuranceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance')] as Object[],
                          "Another user has updated this IdentificationQualityAssurance while you were editing")
                render(view: "edit", model: [identificationQualityAssuranceInstance: identificationQualityAssuranceInstance])
                return
            }
        }

        identificationQualityAssuranceInstance.properties = params

        if (!identificationQualityAssuranceInstance.save(flush: true)) {
            render(view: "edit", model: [identificationQualityAssuranceInstance: identificationQualityAssuranceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), identificationQualityAssuranceInstance.id])
        redirect(action: "show", id: identificationQualityAssuranceInstance.id)
    }

    def delete(Long id) {
        def identificationQualityAssuranceInstance = IdentificationQualityAssurance.get(id)
        if (!identificationQualityAssuranceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), id])
            redirect(action: "list")
            return
        }

        try {
            identificationQualityAssuranceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance'), id])
            redirect(action: "show", id: id)
        }
    }
}
