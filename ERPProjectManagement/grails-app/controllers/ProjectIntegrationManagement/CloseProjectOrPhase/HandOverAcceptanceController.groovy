package ProjectIntegrationManagement.CloseProjectOrPhase

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class HandOverAcceptanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=HandOverAcceptance'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [handOverAcceptanceInstanceList: HandOverAcceptance.list(params), handOverAcceptanceInstanceTotal: HandOverAcceptance.count()]
    }

    def create() {
        [handOverAcceptanceInstance: new HandOverAcceptance(params)]
    }

    def save() {
        def handOverAcceptanceInstance = new HandOverAcceptance(params)
        if (!handOverAcceptanceInstance.save(flush: true)) {
            render(view: "create", model: [handOverAcceptanceInstance: handOverAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), handOverAcceptanceInstance.id])
        redirect(action: "show", id: handOverAcceptanceInstance.id)
    }

    def show(Long id) {
        def handOverAcceptanceInstance = HandOverAcceptance.get(id)
        if (!handOverAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), id])
            redirect(action: "list")
            return
        }

        [handOverAcceptanceInstance: handOverAcceptanceInstance]
    }

    def edit(Long id) {
        def handOverAcceptanceInstance = HandOverAcceptance.get(id)
        if (!handOverAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), id])
            redirect(action: "list")
            return
        }

        [handOverAcceptanceInstance: handOverAcceptanceInstance]
    }

    def update(Long id, Long version) {
        def handOverAcceptanceInstance = HandOverAcceptance.get(id)
        if (!handOverAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (handOverAcceptanceInstance.version > version) {
                handOverAcceptanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance')] as Object[],
                          "Another user has updated this HandOverAcceptance while you were editing")
                render(view: "edit", model: [handOverAcceptanceInstance: handOverAcceptanceInstance])
                return
            }
        }

        handOverAcceptanceInstance.properties = params

        if (!handOverAcceptanceInstance.save(flush: true)) {
            render(view: "edit", model: [handOverAcceptanceInstance: handOverAcceptanceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), handOverAcceptanceInstance.id])
        redirect(action: "show", id: handOverAcceptanceInstance.id)
    }

    def delete(Long id) {
        def handOverAcceptanceInstance = HandOverAcceptance.get(id)
        if (!handOverAcceptanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), id])
            redirect(action: "list")
            return
        }

        try {
            handOverAcceptanceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'handOverAcceptance.label', default: 'HandOverAcceptance'), id])
            redirect(action: "show", id: id)
        }
    }
}
