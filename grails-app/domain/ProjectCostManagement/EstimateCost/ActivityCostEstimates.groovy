package ProjectCostManagement.EstimateCost

class ActivityCostEstimates {
    ProjectTimeManagement.DefineActivity.Activity activity = new ProjectTimeManagement.DefineActivity.Activity()
    ProjectProcurementManagement.AdministerProcurements.MaterialResource amountMaterial = new ProjectProcurementManagement.AdministerProcurements.MaterialResource()
    String resource
    BigDecimal salary
    int labor 
    BigDecimal priceMaterial
    BigDecimal managementCost
    int confidenceLevel
    BigDecimal directCosts
    BigDecimal indirectCosts
    BigDecimal reserve
    BigDecimal estimate
    BigDecimal getDirectCosts(){
        directCosts = (activity.duration * salary * labor) + (amountMaterial.amount * priceMaterial)
        return directCosts
    }
    BigDecimal getIndirectCosts(){
        indirectCosts = managementCost
        return indirectCosts
    }
    BigDecimal getReserve(){
        reserve = (this.directCosts + this.indirectCosts) * ((10-confidenceLevel)/10)
        return reserve
    }
    BigDecimal getEstimate(){
        estimate = this.directCosts + this.indirectCosts + this.reserve
        return estimate
    }
    static transients = ['directCosts','indirectCosts','reserve','estimate']
    String toString(){
        return "$activity"
    }
    static constraints = {
        activity()
        resource(blank:false, inList:["Human Resource","Material","Management"])
        salary()
        labor()
        amountMaterial()
        priceMaterial()
        managementCost()
        confidenceLevel(blank:false, inList:[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}