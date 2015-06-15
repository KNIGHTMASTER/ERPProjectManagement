package ProjectIntegrationManagement.CloseProjectOrPhase

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class HandOverController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=HandOver'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [handOverInstanceList: HandOver.list(params), handOverInstanceTotal: HandOver.count()]
    }

    def create() {
        [handOverInstance: new HandOver(params)]
    }

    def save() {
        def handOverInstance = new HandOver(params)
        if (!handOverInstance.save(flush: true)) {
            render(view: "create", model: [handOverInstance: handOverInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'handOver.label', default: 'HandOver'), handOverInstance.id])
        redirect(action: "show", id: handOverInstance.id)
    }

    def show(Long id) {
        def handOverInstance = HandOver.get(id)
        if (!handOverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOver.label', default: 'HandOver'), id])
            redirect(action: "list")
            return
        }

        [handOverInstance: handOverInstance]
    }

    def edit(Long id) {
        def handOverInstance = HandOver.get(id)
        if (!handOverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOver.label', default: 'HandOver'), id])
            redirect(action: "list")
            return
        }

        [handOverInstance: handOverInstance]
    }

    def update(Long id, Long version) {
        def handOverInstance = HandOver.get(id)
        if (!handOverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOver.label', default: 'HandOver'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (handOverInstance.version > version) {
                handOverInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'handOver.label', default: 'HandOver')] as Object[],
                          "Another user has updated this HandOver while you were editing")
                render(view: "edit", model: [handOverInstance: handOverInstance])
                return
            }
        }

        handOverInstance.properties = params

        if (!handOverInstance.save(flush: true)) {
            render(view: "edit", model: [handOverInstance: handOverInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'handOver.label', default: 'HandOver'), handOverInstance.id])
        redirect(action: "show", id: handOverInstance.id)
    }

    def delete(Long id) {
        def handOverInstance = HandOver.get(id)
        if (!handOverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'handOver.label', default: 'HandOver'), id])
            redirect(action: "list")
            return
        }

        try {
            handOverInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'handOver.label', default: 'HandOver'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'handOver.label', default: 'HandOver'), id])
            redirect(action: "show", id: id)
        }
    }
}
