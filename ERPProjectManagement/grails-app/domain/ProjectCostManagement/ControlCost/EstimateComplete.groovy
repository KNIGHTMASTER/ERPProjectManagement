package ProjectCostManagement.ControlCost

class EstimateComplete {
    int periode
    BigDecimal actualCost
    BigDecimal estimateCost
    BigDecimal trendValue
    BigDecimal forecasting
    BigDecimal esC
    BigDecimal trV
    BigDecimal fc
    static transients = ['forecasting','esC','trV','fc']
    BigDecimal getEsC(){
        if (periode == 1){
            esC = (0.5*actualCost)+((1-0.5)*(actualCost+actualCost))
            return esC
        }else{
            esC = (0.5*actualCost)+((1-0.5)*(estimateCost+trendValue))
            return esC
        }
    }
    BigDecimal getTrV(){
        if (periode == 1){
            trV = (0.01*(esC-actualCost))+((1-0.01)*actualCost)
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
        fc = this.getForecasting() - actualCost
        return fc
    }
    static constraints = {
        periode()
        actualCost()
        estimateCost()
        trendValue()
    }
}
