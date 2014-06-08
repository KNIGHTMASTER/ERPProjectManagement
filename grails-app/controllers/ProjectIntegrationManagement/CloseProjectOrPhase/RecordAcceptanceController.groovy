package ProjectIntegrationManagement.CloseProjectOrPhase

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class RecordAcceptanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=RecordAcceptance'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [recordAcceptanceInstanceList: RecordAcceptance.list(params), recordAcceptanceInstanceTotal: RecordAcceptance.count()]
    }

    def create() {
        [recordAcceptanceInstance: new RecordAcceptance(params)]
    }

    def save() {
        def recordAcceptanceInstance = new RecordAcceptance(params)
        if (!recordAcceptanceInstance.save(flush: true)) {
            render(view: "create", model: [recordAcceptanceInstance: recordAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), recordAcceptanceInstance.id])
        redirect(action: "show", id: recordAcceptanceInstance.id)
    }

    def show(Long id) {
        def recordAcceptanceInstance = RecordAcceptance.get(id)
        if (!recordAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), id])
            redirect(action: "list")
            return
        }

        [recordAcceptanceInstance: recordAcceptanceInstance]
    }

    def edit(Long id) {
        def recordAcceptanceInstance = RecordAcceptance.get(id)
        if (!recordAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), id])
            redirect(action: "list")
            return
        }

        [recordAcceptanceInstance: recordAcceptanceInstance]
    }

    def update(Long id, Long version) {
        def recordAcceptanceInstance = RecordAcceptance.get(id)
        if (!recordAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (recordAcceptanceInstance.version > version) {
                recordAcceptanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'recordAcceptance.label', default: 'RecordAcceptance')] as Object[],
                          "Another user has updated this RecordAcceptance while you were editing")
                render(view: "edit", model: [recordAcceptanceInstance: recordAcceptanceInstance])
                return
            }
        }

        recordAcceptanceInstance.properties = params

        if (!recordAcceptanceInstance.save(flush: true)) {
            render(view: "edit", model: [recordAcceptanceInstance: recordAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), recordAcceptanceInstance.id])
        redirect(action: "show", id: recordAcceptanceInstance.id)
    }

    def delete(Long id) {
        def recordAcceptanceInstance = RecordAcceptance.get(id)
        if (!recordAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), id])
            redirect(action: "list")
            return
        }

        try {
            recordAcceptanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'recordAcceptance.label', default: 'RecordAcceptance'), id])
            redirect(action: "show", id: id)
        }
    }
}
