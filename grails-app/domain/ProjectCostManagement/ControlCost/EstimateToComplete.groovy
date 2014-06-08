package ProjectCostManagement.ControlCost

class EstimateToComplete {
    ProjectCostManagement.DetermineBudget.MonthBudget budget = new ProjectCostManagement.DetermineBudget.MonthBudget()
    int periode
    BigDecimal estimateCost
    BigDecimal trendValue
    BigDecimal actualCostProject
    BigDecimal forecasting
    BigDecimal esC
    BigDecimal trV
    BigDecimal fc
    static transients = ['forecasting','esC','trV','fc']
    BigDecimal getActualCostProject(){
        return budget.getOutcome()
    }
    BigDecimal getEsC(){
        if (periode == 1){
            esC = (0.5*this.getActualCostProject())+((1-0.5)*(this.getActualCostProject()+this.getActualCostProject()))
            return esC
        }else{
            esC = (0.5*this.getActualCostProject())+((1-0.5)*(estimateCost+trendValue))
            return esC
        }
    }
    BigDecimal getTrV(){
        if (periode == 1){
            trV = (0.01*(esC-this.getActualCostProject()))+((1-0.01)*this.getActualCostProject())
            return trV
        }else{
            trV = (0.01*(esC-estimateCost))+((1-0.01)*trendValue)
            return trV
        }
    }
    BigDecimal getFc(){
        fc = this.getForecasting() - this.getActualCostProject()
        return fc
    }
    BigDecimal getForecasting(){
        forecasting = this.getEsC() + this.getTrV()
        return forecasting
    }
    static constraints = {
        budget()
        periode()
        estimateCost()
        trendValue()
    }
}
