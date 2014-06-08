package ProjectCostManagement.EstimateCost

class BasicOfEstimate {
    static belongsTo = 
        [
            idMilestone:ProjectIntegrationManagement.DevelopProjectCharter.Milestones
        ]
    BigDecimal pessimistic
    BigDecimal optimistic
    BigDecimal mostLikelyEstimate
    BigDecimal reserve
    String costMethodology = ["Tree-Point Estimate"]
    BigDecimal estimateCost //menggunakan PERT
    BigDecimal estimateCostProject
    
    BigDecimal getEstimateCost(){
        estimateCost = (pessimistic+(4*mostLikelyEstimate)+optimistic)/6
        return estimateCost
    }
    BigDecimal getReserve(){
        reserve = this.getEstimateCost()*0.1
        return reserve
    }
    BigDecimal getEstimateCostProject(){
        estimateCostProject = this.getEstimateCost() + this.getReserve()
        return estimateCostProject
    }
    static transients = ['estimateCost','reserve','estimateCostProject']
    
    String toString (){
        return "$idMilestone : $estimateCostProject"
    }
    
    static constraints = {
        idMilestone()
        pessimistic()
        optimistic()
        mostLikelyEstimate()
    }
}