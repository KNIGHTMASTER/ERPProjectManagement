package ProjectCostManagement.DetermineBudget

class CostBaseline {
    static hasMany = 
        [
            developProjectManagementPlan:ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan
        ]
    ProjectCostManagement.DetermineBudget.MonthBudget balance = new ProjectCostManagement.DetermineBudget.MonthBudget()
    BigDecimal deviation
    String baseline
    
    BigDecimal getDeviation(){
        deviation = balance.getBalance()
        return deviation
    }
    
    static constraints = {
    }
}
