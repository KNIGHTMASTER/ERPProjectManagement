package ProjectCostManagement.ControlCost

class HumanForecasting {
    ProjectCostManagement.DetermineBudget.MonthBudget budget = new ProjectCostManagement.DetermineBudget.MonthBudget()
    int periode
    BigDecimal actualCost
    BigDecimal estimateCost
    BigDecimal trendValue
    BigDecimal forecasting
    BigDecimal esC
    BigDecimal trV
    BigDecimal fc
    static transients = ['actualCost','forecasting','esC','trV','fc']
    BigDecimal getActualCost(){
        return budget.getHuman()
    }
    BigDecimal getEsC(){
        if (periode == 1){
            esC = (0.5*this.getActualCost())+((1-0.5)*(this.getActualCost()+this.getActualCost()))
            return esC
        }else{
            esC = (0.5*this.getActualCost())+((1-0.5)*(estimateCost+trendValue))
            return esC
        }
    }
    BigDecimal getTrV(){
        if (periode == 1){
            trV = (0.01*(esC-this.getActualCost()))+((1-0.01)*this.getActualCost())
            return trV
        }else{
            trV = (0.01*(esC-estimateCost))+((1-0.01)*trendValue)
            return trV
        }
    }
    BigDecimal getForecasting(){
        forecasting = this.getEsC() + this.getTrV()
        return forecasting
    }
    BigDecimal getFc(){
        fc = this.getForecasting() - this.getActualCost()
        return fc
    }
    static constraints = {
        periode()
        estimateCost()
        trendValue()
    }
}
