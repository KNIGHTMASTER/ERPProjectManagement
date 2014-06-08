package ProjectCostManagement.DetermineBudget

class FinanceEvAcManag {
    static belongsTo =
    [
        managementCostActivity:ManagementCostActivity
    ]
    BigDecimal evr                  
    BigDecimal ac        
    
    BigDecimal getEvr(){
         managementCostActivity.getEv()
    }    
    
    BigDecimal getAc(){
        managementCostActivity.getAc()
    }    
    
    static constraints = {
    }
}
