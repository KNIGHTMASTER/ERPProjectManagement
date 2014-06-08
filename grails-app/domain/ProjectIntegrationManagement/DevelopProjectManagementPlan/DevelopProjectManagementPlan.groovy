package ProjectIntegrationManagement.DevelopProjectManagementPlan

class DevelopProjectManagementPlan {
    Date dateCreated

    Integer planningVersion

    static mapping = {
        autoTimestamp true
    }
   
    static belongsTo= 
    [
            projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
            changeManagementPlan:ChangeManagementPlan,
            scopeManagementPlan:ProjectScopeManagement.DefineScope.ProjectScopeStatement,
            communicationManagementPlan:ProjectCommunicationManagement.PlanCommunications.CommunicationManagementPlan,
    ]

    static hasMany = [
            procurementManagementPlans:ProjectProcurementManagement.PlanProcurement.RequirementProcurement,
            riskManagementPlans:ProjectRiskManagement.Planning.RiskCategories,
            costManagementPlans:ProjectCostManagement.DetermineBudget.CostManagementPlan,
            timeManagementPlans:ProjectTimeManagement.DefineActivity.Activity,
            requirementsDocumentation:ProjectScopeManagement.CollectRequirements.RequirementsDocumentation,
            requirementsManagementPlan:ProjectScopeManagement.CollectRequirements.RequirementsManagementPlan,
            approval:ProjectManagementPlanAcceptance
    ]

            
    String toString(){
        return "$projectCharter"
    }
            
    static constraints = {
        projectName()
        planningVersion()
        changeManagementPlan(nullable:true)
        scopeManagementPlan(nullable:true)
        requirementsDocumentation(nullable: true)
        requirementsManagementPlan(nullable: true)
        timeManagementPlans(nullable:true)
        costManagementPlans(nullable:true)
        riskManagementPlans(nullable:true)
        communicationManagementPlan(nullable:true)
        procurementManagementPlans(nullable:true)
        approval(nullable:true)
    }
}
