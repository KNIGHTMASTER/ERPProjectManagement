package ProjectCostManagement.DetermineBudget

class FinanceOcm {
    static belongsTo = [monthBudget:MonthBudget]
    BigDecimal outcome
    
    BigDecimal getOutcome(){
        monthBudget.getOcm()
    }
    
    static constraints = {
    }
}
