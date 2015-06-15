package WebPage

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class CommunicationDashboardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(["ROLE_ADMIN", "ROLE_PCOM"])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri : '/chooseProject?tautan=CommunicationDashboard'
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [communicationDashboardInstanceList: CommunicationDashboard.list(params), communicationDashboardInstanceTotal: CommunicationDashboard.count()]
    }

    def create() {
        [communicationDashboardInstance: new CommunicationDashboard(params)]
    }

    def save() {
        def communicationDashboardInstance = new CommunicationDashboard(params)
        if (!communicationDashboardInstance.save(flush: true)) {
            render(view: "create", model: [communicationDashboardInstance: communicationDashboardInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), communicationDashboardInstance.id])
        redirect(action: "show", id: communicationDashboardInstance.id)
    }

    def show(Long id) {
        def communicationDashboardInstance = CommunicationDashboard.get(id)
        if (!communicationDashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), id])
            redirect(action: "list")
            return
        }

        [communicationDashboardInstance: communicationDashboardInstance]
    }

    def edit(Long id) {
        def communicationDashboardInstance = CommunicationDashboard.get(id)
        if (!communicationDashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), id])
            redirect(action: "list")
            return
        }

        [communicationDashboardInstance: communicationDashboardInstance]
    }

    def update(Long id, Long version) {
        def communicationDashboardInstance = CommunicationDashboard.get(id)
        if (!communicationDashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (communicationDashboardInstance.version > version) {
                communicationDashboardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard')] as Object[],
                        "Another user has updated this CommunicationDashboard while you were editing")
                render(view: "edit", model: [communicationDashboardInstance: communicationDashboardInstance])
                return
            }
        }

        communicationDashboardInstance.properties = params

        if (!communicationDashboardInstance.save(flush: true)) {
            render(view: "edit", model: [communicationDashboardInstance: communicationDashboardInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), communicationDashboardInstance.id])
        redirect(action: "show", id: communicationDashboardInstance.id)
    }

    def delete(Long id) {
        def communicationDashboardInstance = CommunicationDashboard.get(id)
        if (!communicationDashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), id])
            redirect(action: "list")
            return
        }

        try {
            communicationDashboardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'communicationDashboard.label', default: 'CommunicationDashboard'), id])
            redirect(action: "show", id: id)
        }
    }
}
