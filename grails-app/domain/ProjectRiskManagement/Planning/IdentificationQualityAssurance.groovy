package ProjectRiskManagement.Planning
import ProjectQualityManagement.QualityAssurance.*;
class IdentificationQualityAssurance {
static belongsTo=
    [
        qualityAssurance:ProjectQualityManagement.QualityAssurance,        
        riskCategories:RiskCategories
    ]       
    String risk
    String description
    static constraints = {        
        qualityAssurance(nullable:true)
        riskCategories(nullable:true)
        risk(blank:false,maxSize:500)        
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$qualityAssurance"
    }               
}