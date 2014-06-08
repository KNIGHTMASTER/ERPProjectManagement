package ProjectCostManagement.DetermineBudget

class FinanceEvAc {
    static belongsTo =
    [
        activityCost:ActivityCost
    ]
    BigDecimal evr                  
    BigDecimal ac        
    
    BigDecimal getEvr(){
         activityCost.getEv()
    }    
    
    BigDecimal getAc(){
        activityCost.getAc()
    }
    
    static constraints = {
        activityCost(nullable:true)
        evr(blank:true)
        ac(blank:true)        
    }
}
