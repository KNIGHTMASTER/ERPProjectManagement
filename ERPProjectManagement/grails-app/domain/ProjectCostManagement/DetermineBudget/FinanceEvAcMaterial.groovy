package ProjectCostManagement.DetermineBudget

class FinanceEvAcMaterial {
    static belongsTo =
    [
        materialCostActivity:MaterialCostActivity
    ]
    BigDecimal evr                  
    BigDecimal ac        
    
    BigDecimal getEvr(){
         materialCostActivity.getEv()
    }    
    
    BigDecimal getAc(){
        materialCostActivity.getAc()
    }
    
    static constraints = {
    }
}
