package ProjectCostManagement.DetermineBudget

class Finance3 {
    static belongsTo =
    [
        budget:Budget
    ]    
    BigDecimal income
    
    BigDecimal getIncome(){
        budget.getInc()
    }
    static constraints = {
    }
}
