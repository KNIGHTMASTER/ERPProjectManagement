package ProjectIntegrationManagement.DevelopProjectManagementPlan

import ProjectCommunicationManagement.PlanCommunications.CommunicationManagementPlan
import ProjectCostManagement.DetermineBudget.CostManagementPlan
import ProjectIntegrationManagement.DevelopProjectCharter.Milestones
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectProcurementManagement.PlanProcurement.RequirementProcurement
import ProjectRiskManagement.Planning.RiskCategories
import ProjectScopeManagement.CollectRequirements.RequirementsDocumentation
import ProjectScopeManagement.CollectRequirements.RequirementsManagementPlan
import ProjectScopeManagement.DefineScope.ProjectScopeStatement
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class DevelopProjectManagementPlanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=DevelopProjectManagementPlan'
        }
    }


    def getMaxPlanningVersion(){
        def results2
        def results3
        def results4
        def data = []
        def maksimum
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = DevelopProjectManagementPlan.findAllByProjectName(results3)
            results4.each {
                data.add(it.planningVersion)
            }
            if(data){
                maksimum = Collections.max(data)+1
            }else{
                maksimum = 1
            }
        }else{
            maksimum = 0
        }
        return maksimum
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def results2
        def results3
        def results4
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            results4 = DevelopProjectManagementPlan.findByProjectName(results3)
        }else{
            results4 = DevelopProjectManagementPlan.list(params)
        }

        [developProjectManagementPlanInstanceList: results4, developProjectManagementPlanInstanceTotal: DevelopProjectManagementPlan.count()]
    }

    def create() {
        def results2
        def results3
        def scope
        def requirementsDoc
        def requirementManage
        def changeManagement
        def milestones
        List activities = []
        def timeManagement
        def costManagement
        def riskManagement
        def communicationManagement
        def procurementManagement
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            scope = ProjectScopeStatement.findByProjectName(results3)
            requirementsDoc = RequirementsDocumentation.findAllByProjectName(results3)
            requirementManage = RequirementsManagementPlan.findAllByProjectName(results3)
            changeManagement = ChangeManagementPlan.findByProjectName(results3)
            milestones = cari.milestones
            milestones.each{
                activities.addAll(it.activity)
            }
            costManagement = CostManagementPlan.findAllByProjectName(results3)
            riskManagement = RiskCategories.findAllByProjectCharter(results3)
            communicationManagement = CommunicationManagementPlan.findByProjectName(results3)
            procurementManagement = RequirementProcurement.findAllByProjectName(results3)
            [developProjectManagementPlanInstance: new DevelopProjectManagementPlan(params), maksimum:getMaxPlanningVersion(), namaProyek:results3, scope:scope, requirementsDoc: requirementsDoc, requirementManage: requirementManage, changeManagement: changeManagement, timeManagement: activities, costManagement: costManagement, riskManagement: riskManagement, communicationManagement: communicationManagement, procurementManagement: procurementManagement]
        }else{
            [developProjectManagementPlanInstance: new DevelopProjectManagementPlan(params)]
        }
    }

    def save() {
        def developProjectManagementPlanInstance = new DevelopProjectManagementPlan(params)
        if (!developProjectManagementPlanInstance.save(flush: true)) {
            render(view: "create", model: [developProjectManagementPlanInstance: developProjectManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), developProjectManagementPlanInstance.id])
        redirect(action: "show", id: developProjectManagementPlanInstance.id)
    }

    def show(Long id) {
        def developProjectManagementPlanInstance = DevelopProjectManagementPlan.get(id)
        if (!developProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        def projectName = developProjectManagementPlanInstance.projectName
        def planningVersion = developProjectManagementPlanInstance.planningVersion
        def scope = developProjectManagementPlanInstance.scopeManagementPlan
        def requirementsDoc = developProjectManagementPlanInstance.requirementsDocumentation
        def requirementManage = developProjectManagementPlanInstance.requirementsManagementPlan
        [developProjectManagementPlanInstance: developProjectManagementPlanInstance, maksimum: planningVersion, namaProyek: projectName, scope: scope, requirementsDoc: requirementsDoc, requirementManage: requirementManage]
    }

    def edit(Long id) {
        def developProjectManagementPlanInstance = DevelopProjectManagementPlan.get(id)
        if (!developProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        def results2
        def results3
        def scope
        def requirementsDoc
        def requirementManage
        def changeManagement
        def milestones
        List activities = []
        def timeManagement
        def costManagement
        def riskManagement
        def communicationManagement
        def procurementManagement
        if(session.proyek){
            def cari = StatementOfWork.get(session.proyek)
            results2 = ProjectProposal.findByProjectName(cari)
            results3 = ProjectCharter.findByProjectName(results2)
            scope = ProjectScopeStatement.findByProjectName(results3)
            requirementsDoc = RequirementsDocumentation.findAllByProjectName(results3)
            requirementManage = RequirementsManagementPlan.findAllByProjectName(results3)
            changeManagement = ChangeManagementPlan.findByProjectName(results3)
            milestones = cari.milestones
            milestones.each{
                activities.addAll(it.activity)
            }
            costManagement = CostManagementPlan.findAllByProjectName(results3)
            riskManagement = RiskCategories.findAllByProjectCharter(results3)
            communicationManagement = CommunicationManagementPlan.findByProjectName(results3)
            procurementManagement = RequirementProcurement.findAllByProjectName(results3)

            [developProjectManagementPlanInstance: developProjectManagementPlanInstance,maksimum:developProjectManagementPlanInstance.planningVersion, namaProyek:results3, scope:scope, requirementsDoc: requirementsDoc, requirementManage: requirementManage, changeManagement: changeManagement, timeManagement: activities, costManagement: costManagement, riskManagement: riskManagement, communicationManagement: communicationManagement, procurementManagement: procurementManagement]
        }else{
            [developProjectManagementPlanInstance: developProjectManagementPlanInstance]
        }

    }

    def update(Long id, Long version) {
        def developProjectManagementPlanInstance = DevelopProjectManagementPlan.get(id)
        if (!developProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (developProjectManagementPlanInstance.version > version) {
                developProjectManagementPlanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan')] as Object[],
                          "Another user has updated this DevelopProjectManagementPlan while you were editing")
                render(view: "edit", model: [developProjectManagementPlanInstance: developProjectManagementPlanInstance])
                return
            }
        }

        developProjectManagementPlanInstance.properties = params

        if (!developProjectManagementPlanInstance.save(flush: true)) {
            render(view: "edit", model: [developProjectManagementPlanInstance: developProjectManagementPlanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), developProjectManagementPlanInstance.id])
        redirect(action: "show", id: developProjectManagementPlanInstance.id)
    }

    def delete(Long id) {
        def developProjectManagementPlanInstance = DevelopProjectManagementPlan.get(id)
        if (!developProjectManagementPlanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), id])
            redirect(action: "list")
            return
        }

        try {
            developProjectManagementPlanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan'), id])
            redirect(action: "show", id: id)
        }
    }
}
