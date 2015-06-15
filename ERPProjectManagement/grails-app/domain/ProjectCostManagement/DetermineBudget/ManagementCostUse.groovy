package ProjectCostManagement.DetermineBudget

class ManagementCostUse {
    static belongsTo = [managementCostActivity : ManagementCostActivity]
    static hasMany = [managementCostPayment : ManagementCostPayment]
    ManagementCostActivity managementCostActivity
    Date usedDate
    BigDecimal price
    boolean isUsed
    String description
    BigDecimal totalPayment
    static transients = ['totalPayment']
    BigDecimal getTotalPayment(){
        def payment = ManagementCostPayment.executeQuery("select sum(t.price) from ManagementCostPayment t where t.managementCostUse=${this.id} and isPayed=true")
        payment?payment[0]:0
    }
    static constraints = {
        managementCostActivity(blank:false)
        price(blank:false)
        usedDate()
        isUsed()
        description(nullable:true,maxSize:500)
    }
    String  toString(){
        return "$managementCostActivity|Use =  $price"
    }
    static printFields = ['managementCostActivity','detail','price','usedDate','isUsed','description']
    static mapping = {
        order  "asc"
        sort   "managementCostActivity"
    }
}
