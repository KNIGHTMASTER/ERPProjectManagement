package ProjectIntegrationManagement.MonitoringAndControllingProjectWork

import ProjectCostManagement.DetermineBudget.ActivityCost
import ProjectCostManagement.DetermineBudget.Budget
import ProjectCostManagement.DetermineBudget.Cost
import ProjectCostManagement.DetermineBudget.HumanResourceCost
import ProjectCostManagement.DetermineBudget.ManagementCostActivity
import ProjectCostManagement.DetermineBudget.MaterialCostActivity
import ProjectCostManagement.DetermineBudget.Modal
import ProjectHumanResourceManagement.Employee
import ProjectIntegrationManagement.DevelopProjectCharter.Payment
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectProcurementManagement.AdministerProcurements.Contract
import ProjectProcurementManagement.ConductProcurements.VendorRegister
import ProjectRiskManagement.Planning.IdentificationCostManagementPlan
import ProjectRiskManagement.Planning.IdentificationProjectScopeStatement
import ProjectRiskManagement.Planning.IdentificationTimeManagementPlan
import ProjectRiskManagement.Planning.RiskCategories
import ProjectTimeManagement.DefineActivity.Activity
import ProjectTimeManagement.DefineActivity.DelayActivity
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class PerspektifController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_PM'])
    def index() {
        if(session.proyek){
            redirect(action: "list", params: params)
        }else{
            redirect uri:'/chooseProject?tautan=Perspektif'
        }
    }

//==================START OBJECT QUERY=================
    //MATERIAL COST ACTIVITY
    def get_EV_MaterialCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def materialCostActivities
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    materialCostActivities = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where activity = ${it.id}")
                    materialCostActivities.each{
                        result += it.earnedValue
                    }
                }
            }
        }else{
            def data = MaterialCostActivity.list()
            data.each {
                result+=it.earnedValue
            }
        }
        return result
    }

    def get_AC_MaterialCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def materialCostActivities
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    materialCostActivities = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where activity = ${it.id}")
                    materialCostActivities.each{
                        result += it.actualCost
                    }
                }
            }
        }else{
            def data = MaterialCostActivity.list()
            data.each {
                result+=it.actualCost
            }
        }
        return result
    }

    //MANAGEMENT COST ACTIVITY
    def get_EV_ManagementCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def cost = Cost.findAllByProject(charter)
            def managementCostActivities
            cost.each{
                managementCostActivities = ManagementCostActivity.executeQuery("select t from ManagementCostActivity t where t.cost=${it.id}")
                managementCostActivities.each {
                    result += it.earnedValue
                }
            }
        }else{
            def data = ManagementCostActivity.list()
            data.each {
                result+=it.earnedValue
            }
        }
        return result
    }

    def get_AC_ManagementCostActivity(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def cost = Cost.findAllByProject(charter)
            def managementCostActivities
            cost.each{
                managementCostActivities = ManagementCostActivity.executeQuery("select t from ManagementCostActivity t where t.cost=${it.id}")
                managementCostActivities.each {
                    result += it.actualCost
                }
            }
        }else{
            def data = ManagementCostActivity.list()
            data.each {
                result+=it.actualCost
            }
        }
        return result
    }

    //ACTIVITY COST
    def get_EV_ActivityCost(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def activityCost
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    activityCost = ActivityCost.executeQuery("select t from ActivityCost t where activity = ${it.id}")
                    activityCost.each{
                        result += it.earnedValue
                    }
                }
            }
        }else{
            def data = ActivityCost.list()
            data.each {
                result+=it.earnedValue
            }
        }
        return result
    }

    def get_AC_ActivityCost(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def activityCost
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    activityCost = ActivityCost.executeQuery("select t from ActivityCost t where activity = ${it.id}")
                    activityCost.each{
                        result += it.actualCost
                    }
                }
            }
        }else{
            def data = ActivityCost.list()
            data.each {
                result+=it.actualCost
            }
        }
        return result
    }


    //EV TOTAL : MATERIAL + MANAGEMENT + ACTIVITY
    def getEvTotal(){
        return get_EV_ActivityCost()+get_EV_ManagementCostActivity()+get_EV_MaterialCostActivity()
    }

    //AC TOTAL : MATERIAL + MANAGEMENT + ACTIVITY
    def getAcTotal(){
        return get_AC_ActivityCost()+get_AC_ManagementCostActivity()+get_AC_MaterialCostActivity()
    }

    //PAYMENT
    def getIncome(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def payment = Payment.findAllByProjectName(charter)
            payment.each{
                result += it.cost
            }
        }else{
            def data = Payment.list()
            data.each{
                result += it.cost
            }
        }
        return result
    }

    //BALANCE
    def getNetIncome(){
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def budget =  Budget.findByProject(charter)
            result = budget.balance
        }else{
            def data = Budget.list()
            data.each{
                result += it.balance
            }
        }
        return result
    }

    //Modal
    def getShareHolderEquity(){
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def she =  Modal.findByProjectName(charter)
            result = she.value
        }else{
            def data = Modal.list()
            data.each{
                result += it.value
            }
        }
        return result
    }

    //PV HRM
    def getPV_HumanResource(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def activityCost
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    activityCost = ActivityCost.executeQuery("select t from ActivityCost t where activity = ${it.id}")
                    activityCost.each{
                        result += it.total
                    }
                }
            }
        }else{
            def data = ActivityCost.list()
            data.each {
                result+=it.total
            }
        }
        return result
    }

    //PV Management
    def getPV_Management(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def cost = Cost.findAllByProject(charter)
            def managementCostActivities
            cost.each{
                managementCostActivities = ManagementCostActivity.executeQuery("select t from ManagementCostActivity t where t.cost=${it.id}")
                managementCostActivities.each {
                    result += it.price
                }
            }
        }else{
            def data = ManagementCostActivity.list()
            data.each {
                result+=it.price
            }
        }
        return result
    }

    //PV Material
    def getPV_Material(){

        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def activities
            def materialCostActivities
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activities.each{
                    materialCostActivities = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where activity = ${it.id}")
                    materialCostActivities.each{
                        result += it.total
                    }
                }
            }
        }else{
            def data = MaterialCostActivity.list()
            data.each {
                result+=it.total
            }
        }
        return result
    }

    def getPVTotal(){
        return getPV_HumanResource() + getPV_Management() + getPV_Material()
    }

    //n Activity per proyek
    def getN_Activity(){
        def hasil = 0
        if(session.proyek){
            def activities = []
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            milestones.each{
                activities.add(it.activity)
            }
            hasil = activities.size()
        }else{
            hasil = Activity.list().size()
        }
        return hasil
    }

    def getN_Delay(){
        def hasil = 0
        if(session.proyek){
            def activities
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def delays
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where t.idMilestone=${it.id}")
                activities.each{
                    delays = DelayActivity.executeQuery("select t from DelayActivity t where t.activity=${it.id}")
                    delays.each {
                        hasil += 1
                    }
                }
            }
        }else{
            hasil = DelayActivity.list().size()
        }

        return hasil
    }

    def getLossTime(){
        def hasil = 0
        if(session.proyek){
            def activities
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            def delays
            milestones.each{
                activities = Activity.executeQuery("select t from Activity t where t.idMilestone=${it.id}")
                activities.each{
                    delays = DelayActivity.executeQuery("select t from DelayActivity t where t.activity=${it.id}")
                    delays.each {
                        hasil += it.difference
                    }
                }
            }
        }else{
            def data = DelayActivity.list()
            data.each{
                hasil += it.difference
            }
        }
        return hasil
    }

    def getNRiskIdentified(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def riskCategories = RiskCategories.findAllByProjectCharter(charter)
            riskCategories.each{
                result += 1
            }
        }else{
            RiskCategories.list().size()
        }
        return result
    }

    def getNCostRisk(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def r
            def identificationCost
            charter.each{
                r = RiskCategories.executeQuery("select t from RiskCategories t where t.projectCharter = ${it.id}")
                r.each{
                    identificationCost = IdentificationCostManagementPlan.executeQuery("select t from ProjectRiskManagement.Planning.IdentificationCostManagementPlan t where t.riskCategories = ${it.id}")
                    identificationCost.each{
                        result += 1
                    }
                }
            }
        }else{
            result = IdentificationCostManagementPlan.list().size()
        }
        return result
    }

    def getNTimeRisk(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def r
            def identificationCost
            charter.each{
                r = RiskCategories.executeQuery("select t from RiskCategories t where t.projectCharter = ${it.id}")
                r.each{
                    identificationCost = IdentificationTimeManagementPlan.executeQuery("select t from ProjectRiskManagement.Planning.IdentificationTimeManagementPlan t where t.riskCategories = ${it.id}")
                    identificationCost.each{
                        result += 1
                    }
                }
            }
        }else{
            result = IdentificationTimeManagementPlan.list().size()
        }
        return result
    }

    def getNScopeRisk(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def r
            def identificationCost
            charter.each{
                r = RiskCategories.executeQuery("select t from RiskCategories t where t.projectCharter = ${it.id}")
                r.each{
                    identificationCost = IdentificationProjectScopeStatement.executeQuery("select t from ProjectRiskManagement.Planning.IdentificationProjectScopeStatement t where t.riskCategories = ${it.id}")
                    identificationCost.each{
                        result += 1
                    }
                }
            }
        }else{
            result = IdentificationProjectScopeStatement.list().size()
        }
        return result
    }

    def getNVendor(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def vendor = VendorRegister.findAllByProjectName(charter)
            vendor.each{
                result += 1
            }
        }else{
            result = VendorRegister.list().size()
        }
        return result
    }

    def getNAcceptedVendor(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            def vendor
            charter.each{
                vendor = Contract.executeQuery("select distinct vendorName from Contract t where t.id=${it.id}")
                vendor.each {
                    result += 1
                }
            }
        }else{
            result = VendorRegister.list().size()
        }
        return result
    }

    def getNStakeholder(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def employee = Employee.findAllByProject(sow)
            employee.each{
                result += 1
            }
        }else{
            result = Employee.list().size()
        }
        return result
    }

    def getNComplain(){
        def result = 0
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def complain = Customer.findAllByProjectName(sow)
            complain.each{
                result += 1
            }
        }else{
            result = Customer.list().size()
        }
        return result
    }

    def getTotalDay(){
        def hasil = 0
        if(session.proyek){
            def activities
            def sow = StatementOfWork.get(session.proyek)
            def milestones = sow.milestones
            milestones.each{
                activities = it.activity
                activities.each {
                    hasil += it.duration
                }
            }
        }else{
            def data = Activity.list()
            data.each{
                hasil += it.duration
            }
        }
        return hasil
    }

    //==================END OF OBJECT QUERY=================

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result
        if(session.proyek){
            def sow = StatementOfWork.get(session.proyek)
            def proposal = ProjectProposal.findByProjectName(sow)
            def charter = ProjectCharter.findByProjectName(proposal)
            result = Perspektif.findAllByProjectName(charter)
        }else{
            result = Perspektif.list(params)
        }

        [
            perspektifInstanceList: Perspektif.list(params), perspektifInstanceTotal: Perspektif.count(),
            evTotal:getEvTotal(), acTotal:getAcTotal(), income:getIncome(), netIncome:getNetIncome(),
            shareholderequity:getShareHolderEquity(), pvTotal:getPVTotal(), nActivity:getN_Activity(),
            nDelay:getN_Delay(), lossTime:getLossTime(), nRisk:getNRiskIdentified(), nCostRisk:getNCostRisk(),
            nTimeRisk:getNTimeRisk(), nScopeRisk:getNScopeRisk(),nVendor:getNVendor(),nAcceptedVendor:getNAcceptedVendor(),
            nStakeholder:getNStakeholder(),nComplain:getNComplain(), totalDay:getTotalDay()
        ]
    }

    def create() {
        [perspektifInstance: new Perspektif(params)]
    }

    def save() {
        def perspektifInstance = new Perspektif(params)
        if (!perspektifInstance.save(flush: true)) {
            render(view: "create", model: [perspektifInstance: perspektifInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), perspektifInstance.id])
        redirect(action: "show", id: perspektifInstance.id)
    }

    def show(Long id) {
        def perspektifInstance = Perspektif.get(id)
        if (!perspektifInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), id])
            redirect(action: "list")
            return
        }

        [perspektifInstance: perspektifInstance]
    }

    def edit(Long id) {
        def perspektifInstance = Perspektif.get(id)
        if (!perspektifInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), id])
            redirect(action: "list")
            return
        }

        [perspektifInstance: perspektifInstance]
    }

    def update(Long id, Long version) {
        def perspektifInstance = Perspektif.get(id)
        if (!perspektifInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (perspektifInstance.version > version) {
                perspektifInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'perspektif.label', default: 'Perspektif')] as Object[],
                          "Another user has updated this Perspektif while you were editing")
                render(view: "edit", model: [perspektifInstance: perspektifInstance])
                return
            }
        }

        perspektifInstance.properties = params

        if (!perspektifInstance.save(flush: true)) {
            render(view: "edit", model: [perspektifInstance: perspektifInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), perspektifInstance.id])
        redirect(action: "show", id: perspektifInstance.id)
    }

    def delete(Long id) {
        def perspektifInstance = Perspektif.get(id)
        if (!perspektifInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), id])
            redirect(action: "list")
            return
        }

        try {
            perspektifInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'perspektif.label', default: 'Perspektif'), id])
            redirect(action: "show", id: id)
        }
    }
}
