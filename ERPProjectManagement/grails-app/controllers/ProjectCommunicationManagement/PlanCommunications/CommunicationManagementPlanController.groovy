package ProjectCommunicationManagement.PlanCommunications

import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import org.springframework.dao.DataIntegrityViolationException

class CommunicationManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            temp = ProjectCharter.findByProjectName(temp)
            results = CommunicationManagementPlan.findAllByProjectName(temp)
        }else{
            results = CommunicationManagementPlan.list(params)
        }
        [communicationManagementPlanInstanceList: results, communicationManagementPlanInstanceTotal: CommunicationManagementPlan.count()]
    }

    def getNamaProyek(){
        def results
        if(session.proyek){
            def temp = StatementOfWork.get(session.proyek)
            temp = ProjectProposal.findByProjectName(temp)
            results = ProjectCharter.findByProjectName(temp)
        }else{
            results = ProjectCharter.list(params)
        }
        return results
    }

    def create() {
        [communicationManagementPlanInstance: new CommunicationManagementPlan(params), namaProyek:getNamaProyek()]
    }

    def save() {
        def communicationManagementPlanInstance = new CommunicationManagementPlan(params)
        if (!communicationManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [communicationManagementPlanInstance: communicationManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), communicationManagementPlanInstance.id])
        redirect(action: "show", id: communicationManagementPlanInstance.id)
    }

    def show(Long id) {
        def communicationManagementPlanInstance = CommunicationManagementPlan.get(id)
        if (!communicationManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [communicationManagementPlanInstance: communicationManagementPlanInstance]
    }

    def edit(Long id) {
        def communicationManagementPlanInstance = CommunicationManagementPlan.get(id)
        if (!communicationManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [communicationManagementPlanInstance: communicationManagementPlanInstance, namaProyek:getNamaProyek()]
    }

    def update(Long id, Long version) {
        def communicationManagementPlanInstance = CommunicationManagementPlan.get(id)
        if (!communicationManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (communicationManagementPlanInstance.version > version) {
                communicationManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan')] as Object[],
                          "Another user has updated this CommunicationManagementPlan while you were editing")
                render(view: "edit", model: [communicationManagementPlanInstance: communicationManagementPlanInstance])
                return
            }
        }

        communicationManagementPlanInstance.properties = params

        if (!communicationManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [communicationManagementPlanInstance: communicationManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), communicationManagementPlanInstance.id])
        redirect(action: "show", id: communicationManagementPlanInstance.id)
    }

    def delete(Long id) {
        def communicationManagementPlanInstance = CommunicationManagementPlan.get(id)
        if (!communicationManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            communicationManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
