package ProjectCostManagement.DetermineBudget

class MaterialCostActivity {
    static belongsTo = 
    [
        Cost,
        ProjectTimeManagement.DefineActivity.Activity
    ]

    Cost cost
    ProjectTimeManagement.DefineActivity.Activity activity

    ProjectProcurementManagement.AdministerProcurements.PurchaseVendor material = new ProjectProcurementManagement.AdministerProcurements.PurchaseVendor()
    static hasMany = [materialCostUse : MaterialCostUse]
    String  description
    boolean approve
    BigDecimal price
    BigDecimal  total //pv
    BigDecimal  earnedValue
    BigDecimal  actualCost
    BigDecimal ev
    BigDecimal ac
    
    static transients = ['price','total','earnedValue','actualCost','ev', 'ac']
    BigDecimal getPrice(){
        return material.pricePerUnit
    }
    BigDecimal getTotal(){
        return material.priceTotal
    }
    BigDecimal  getEarnedValue(){
        def m = MaterialCostUse.executeQuery("select t from MaterialCostUse t where t.materialCostActivity=${this.id} and t.isUsed=true")
        def tot=0
        m?m.each{
            tot+=it.total
        }:0
        tot?:0
    }
    BigDecimal  getActualCost(){
        def m = MaterialCostPayment.executeQuery("select t from MaterialCostPayment t where t.materialCost=${this.id} and t.isPayed=true")
        def tot=0
        m?m.each{
            tot+=it.total
        }:0
        tot?:0
    }
    
    BigDecimal getEv(){
        this.getEarnedValue()
    }

    BigDecimal getAc(){
        this.getActualCost()
    }
    
    static constraints = {
        cost(blank:false)
        activity(blank:false)
        approve()
        description(nullable:true,maxSize:500)
    }
  
    static printFields = ['cost','activity','material','description']

    String toString(){
        return "$activity|$material"
    }
    static mapping = {
        order  "asc"
        sort   "activity"
    }
}