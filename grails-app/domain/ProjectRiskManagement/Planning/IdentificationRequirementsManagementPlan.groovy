package ProjectRiskManagement.Planning
import ProjectScopeManagement.CollectRequirements.RequirementsDocumentation;
class IdentificationRequirementsManagementPlan {
static belongsTo=
    [
        requirementsDocumentation:ProjectScopeManagement.CollectRequirements.RequirementsDocumentation,
        riskCategories:RiskCategories
    ]                
    String risk
    String description
    static constraints = {
        requirementsDocumentation(nullable:true)
        riskCategories(nullable:true)
        risk(blank:false,maxSize:500)
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$requirementsDocumentation"
    }
}
