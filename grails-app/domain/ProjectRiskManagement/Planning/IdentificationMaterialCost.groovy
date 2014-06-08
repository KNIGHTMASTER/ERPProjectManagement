package ProjectRiskManagement.Planning
import ProjectCostManagement.DetermineBudget.MaterialCostActivity;
class IdentificationMaterialCost {
static belongsTo=
    [
        materialCostActivity:ProjectCostManagement.DetermineBudget.MaterialCostActivity,
        riskCategories:RiskCategories
    ]
    String description
    
    BigDecimal ambil
    String risk
    BigDecimal getAmbil(){
        return materialCostActivity.getTotal()
    }
    String getRisk(){
        if (this.getAmbil()>100000000){
            return "Very High"
        } else if (this.getAmbil()>50000000 && this.getAmbil()<=100000000){
            return "High"
        } else if (this.getAmbil()>25000000 && this.getAmbil()<=50000000){
            return "Medium"
        } else if (this.getAmbil()>=10000000 && this.getAmbil()<=25000000){
            return "Low"
        } else if (this.getAmbil()<10000000){
            return "Very Low"
        }
        else{
            return "Wrong"
        }        
    }        
    static transients=['ambil','risk']

    static constraints = {
        materialCostActivity(nullable:true)
        riskCategories(nullable:true)
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$materialCostActivity"
    }
}
