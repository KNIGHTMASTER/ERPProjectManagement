package ProjectCostManagement.ControlCost

class AnalysisEVM {
    static belongsTo = [idMilestone : ProjectIntegrationManagement.DevelopProjectCharter.Milestones]
    BigDecimal plannedValue
    BigDecimal earnedValue
    BigDecimal actualCost
    BigDecimal cpi
    BigDecimal spi
    String costPI
    String schedulePI
    BigDecimal getCpi(){
        return cpi = earnedValue / actualCost
        return cpi
    }
    BigDecimal getSpi(){
        return spi = earnedValue / plannedValue
        return spi
    }
    String getCostPI(){
        if(this.getCpi() == 1){
            return "Same as the Budget"
        }else if(this.getCpi() > 1){
            return "Less than Budget"
        }else if(this.getCpi() < 1){
            return "Over Budget"
        }
    }
    String getSchedulePI(){
        if(this.getSpi() == 1){
            return "Ontime"
        }else if(this.getSpi() > 1){
            return "Intime"
        }else if(this.getSpi() < 1){
            return "Late"
        }
    }
    static transients = ['cpi','spi','costPI','schedulePI']
    static constraints = {
        idMilestone(blank:false)
        plannedValue(blank:false)
        earnedValue(blank:false)
        actualCost(blank:false)
    }
}
