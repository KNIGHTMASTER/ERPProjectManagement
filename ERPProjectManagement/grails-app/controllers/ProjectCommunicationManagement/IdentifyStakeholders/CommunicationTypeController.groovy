package ProjectCommunicationManagement.IdentifyStakeholders

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import org.springframework.dao.DataIntegrityViolationException

class CommunicationTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def getNamaProyek(){
        def result
        if(session.proyek){
            result = StatementOfWork.get(session.proyek)
        }else{
            result = StatementOfWork.list()
        }
        return result
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            results = CommunicationType.findAllByStatementOfWork(temp)
        }else{
            results = CommunicationType.list(params)
        }
        [communicationTypeInstanceList: results, communicationTypeInstanceTotal: CommunicationType.count()]
    }

    def create() {
        [communicationTypeInstance: new CommunicationType(params), namaProyek:getNamaProyek()]
    }

    def save() {
        def communicationTypeInstance = new CommunicationType(params)
        if (!communicationTypeInstance.save(flush: true)) {
            render(view: "create", model: [communicationTypeInstance: communicationTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), communicationTypeInstance.id])
        redirect(action: "show", id: communicationTypeInstance.id)
    }

    def show(Long id) {
        def communicationTypeInstance = CommunicationType.get(id)
        if (!communicationTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), id])
            redirect(action: "list")
            return
        }

        [communicationTypeInstance: communicationTypeInstance]
    }

    def edit(Long id) {
        def communicationTypeInstance = CommunicationType.get(id)
        if (!communicationTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), id])
            redirect(action: "list")
            return
        }

        [communicationTypeInstance: communicationTypeInstance, namaProyek:getNamaProyek()]
    }

    def update(Long id, Long version) {
        def communicationTypeInstance = CommunicationType.get(id)
        if (!communicationTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (communicationTypeInstance.version > version) {
                communicationTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'communicationType.label', default: 'CommunicationType')] as Object[],
                        "Another user has updated this CommunicationType while you were editing")
                render(view: "edit", model: [communicationTypeInstance: communicationTypeInstance])
                return
            }
        }

        communicationTypeInstance.properties = params

        if (!communicationTypeInstance.save(flush: true)) {
            render(view: "edit", model: [communicationTypeInstance: communicationTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), communicationTypeInstance.id])
        redirect(action: "show", id: communicationTypeInstance.id)
    }

    def delete(Long id) {
        def communicationTypeInstance = CommunicationType.get(id)
        if (!communicationTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), id])
            redirect(action: "list")
            return
        }

        try {
            communicationTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'communicationType.label', default: 'CommunicationType'), id])
            redirect(action: "show", id: id)
        }
    }
}
