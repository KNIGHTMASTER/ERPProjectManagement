package ProjectRiskManagement.Planning
import ProjectScopeManagement.DefineScope.ProjectScopeStatement.*;
class IdentificationProjectScopeStatement {
static belongsTo=
    [
        projectScopeStatement:ProjectScopeManagement.DefineScope.ProjectScopeStatement,
        riskCategories:RiskCategories
    ]                
    String risk
    String description
    static constraints = {        
        projectScopeStatement(nullable:true)
        riskCategories(nullable:true)
        risk(blank:false,maxSize:500)
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$projectScopeStatement, ScopeRiskIdentified: ID : $id"
    }               
}