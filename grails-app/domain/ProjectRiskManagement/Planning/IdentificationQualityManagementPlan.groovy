package ProjectRiskManagement.Planning
import ProjectQualityManagement.QualityManagementPlan.*;
class IdentificationQualityManagementPlan {
static belongsTo=
    [
        qualityManagementPlan:ProjectQualityManagement.QualityManagementPlan,        
        riskCategories:RiskCategories
    ]       
    String risk
    String description
    static constraints = {        
        qualityManagementPlan(nullable:true)
        riskCategories(nullable:true)
        risk(blank:false,maxSize:500)        
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$qualityManagementPlan, qualityRiskIdentified: ID : $id"
    }               
}