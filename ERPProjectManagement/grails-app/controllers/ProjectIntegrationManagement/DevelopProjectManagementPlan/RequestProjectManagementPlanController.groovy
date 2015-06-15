package ProjectIntegrationManagement.DevelopProjectManagementPlan

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRoles
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class RequestProjectManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=RequestProjectManagementPlan'
        }
    }

    def getNamaProyek(){
        def results2
        def results3
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
        }else{
            results3 = ProjectCharter.list(params)
        }
        return results3
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def sesiproyek = session.proyek
        def results2
        def results3
        def results4
        if(sesiproyek){
            def cari = StatementOfWork.get(sesiproyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = RequestProjectManagementPlan.findAllByProjectName(results3)
        }else{
            results4 = RequestProjectManagementPlan.list(params)
        }
        [requestProjectManagementPlanInstanceList: results4, requestProjectManagementPlanInstanceTotal: RequestProjectManagementPlan.count()]
    }

    def create() {
        [requestProjectManagementPlanInstance: new RequestProjectManagementPlan(params), namaProyek: getNamaProyek()]
    }

    def sendMail(def username, def email, def message, def project){
        sendMail{
            to email
            from "fauzi@erpprojectmanagement.com"
            subject "Request Project Management Plan for Project $project"
            body message
        }
    }

    def save() {
        def requestProjectManagementPlanInstance = new RequestProjectManagementPlan(params)
        if (!requestProjectManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [requestProjectManagementPlanInstance: requestProjectManagementPlanInstance])
            return
        }

        //send email
        if(params.request){
            def data = params.functionalPlan
            def functionalManager
            switch(data){
                case 'Time Management Plan': functionalManager = 'Functional Time Manager';break;
                case 'Cost Management Plan': functionalManager = 'Functional Cost Manager';break;
                case 'Risk Management Plan': functionalManager = 'Functional Risk Manager';break;
                case 'Procurement Management Plan': functionalManager = 'Functional Procurement Manager';break;
                case 'Communication Management Plan': functionalManager = 'Functional Communication Manager';break;
                case 'Human Resource Management Plan': functionalManager = 'Functional Human Resource Manager';break;
            }
            def role = StakeholderRoles.findByRole(functionalManager)
            def username = StakeholderRegister.findByRole(role).fullName
            def email = StakeholderRegister.findByRole(role).email
            def message = params.message
            def project = params.projectName.id

            sendMail(username, email, message, project)
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), requestProjectManagementPlanInstance.id])
        redirect(action: "show", id: requestProjectManagementPlanInstance.id)
    }

    def show(Long id) {
        def requestProjectManagementPlanInstance = RequestProjectManagementPlan.get(id)
        if (!requestProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [requestProjectManagementPlanInstance: requestProjectManagementPlanInstance]
    }

    def edit(Long id) {
        def requestProjectManagementPlanInstance = RequestProjectManagementPlan.get(id)
        if (!requestProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        [requestProjectManagementPlanInstance: requestProjectManagementPlanInstance, , namaProyek: getNamaProyek()]
    }

    def update(Long id, Long version) {
        def requestProjectManagementPlanInstance = RequestProjectManagementPlan.get(id)
        if (!requestProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requestProjectManagementPlanInstance.version > version) {
                requestProjectManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan')] as Object[],
                          "Another user has updated this RequestProjectManagementPlan while you were editing")
                render(view: "edit", model: [requestProjectManagementPlanInstance: requestProjectManagementPlanInstance])
                return
            }
        }

        requestProjectManagementPlanInstance.properties = params

        if (!requestProjectManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [requestProjectManagementPlanInstance: requestProjectManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), requestProjectManagementPlanInstance.id])
        redirect(action: "show", id: requestProjectManagementPlanInstance.id)
    }

    def delete(Long id) {
        def requestProjectManagementPlanInstance = RequestProjectManagementPlan.get(id)
        if (!requestProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            requestProjectManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
