package ProjectRiskManagement.Planning
import ProjectCostManagement.DetermineBudget.CostManagementPlan;
class IdentificationCostManagementPlan {
static belongsTo=
    [
        costManagementPlan:ProjectCostManagement.DetermineBudget.CostManagementPlan,
        riskCategories:RiskCategories
    ]
    ProjectCostManagement.DetermineBudget.CostManagementPlan costManagementPlan
    RiskCategories riskCategories

    String description
    BigDecimal cost
    String risk
    BigDecimal getCost(){
        return costManagementPlan.plannedValue
    }
    String getRisk(){
        if (this.getCost()>1000000000){
            return "Very High"
        } else if (this.getCost()>500000000 && this.getCost()<=1000000000){
            return "High"
        } else if (this.getCost()>250000000 && this.getCost()<=500000000){
            return "Medium"
        } else if (this.getCost()>=100000000 && this.getCost()<=250000000){
            return "Low"
        } else if (this.getCost()<100000000){
            return "Very Low"
        }
        else{
            return "Wrong"
        }        
    }        
    
    static transients=['risk','cost']
    
    static constraints = {
        costManagementPlan(nullable:true)
        riskCategories(nullable:true)
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$costManagementPlan"
    }
}
