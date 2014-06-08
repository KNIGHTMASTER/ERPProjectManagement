package ProjectIntegrationManagement.CloseProjectOrPhase

import org.springframework.dao.DataIntegrityViolationException

class PhaseRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [phaseRecordInstanceList: PhaseRecord.list(params), phaseRecordInstanceTotal: PhaseRecord.count()]
    }

    def create() {
        [phaseRecordInstance: new PhaseRecord(params)]
    }

    def save() {
        def phaseRecordInstance = new PhaseRecord(params)
        if (!phaseRecordInstance.save(flush: true)) {
            render(view: "create", model: [phaseRecordInstance: phaseRecordInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), phaseRecordInstance.id])
        redirect(action: "show", id: phaseRecordInstance.id)
    }

    def show(Long id) {
        def phaseRecordInstance = PhaseRecord.get(id)
        if (!phaseRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), id])
            redirect(action: "list")
            return
        }

        [phaseRecordInstance: phaseRecordInstance]
    }

    def edit(Long id) {
        def phaseRecordInstance = PhaseRecord.get(id)
        if (!phaseRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), id])
            redirect(action: "list")
            return
        }

        [phaseRecordInstance: phaseRecordInstance]
    }

    def update(Long id, Long version) {
        def phaseRecordInstance = PhaseRecord.get(id)
        if (!phaseRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (phaseRecordInstance.version > version) {
                phaseRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'phaseRecord.label', default: 'PhaseRecord')] as Object[],
                          "Another user has updated this PhaseRecord while you were editing")
                render(view: "edit", model: [phaseRecordInstance: phaseRecordInstance])
                return
            }
        }

        phaseRecordInstance.properties = params

        if (!phaseRecordInstance.save(flush: true)) {
            render(view: "edit", model: [phaseRecordInstance: phaseRecordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), phaseRecordInstance.id])
        redirect(action: "show", id: phaseRecordInstance.id)
    }

    def delete(Long id) {
        def phaseRecordInstance = PhaseRecord.get(id)
        if (!phaseRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), id])
            redirect(action: "list")
            return
        }

        try {
            phaseRecordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'phaseRecord.label', default: 'PhaseRecord'), id])
            redirect(action: "show", id: id)
        }
    }
}
