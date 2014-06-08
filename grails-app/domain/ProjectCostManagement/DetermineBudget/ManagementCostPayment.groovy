package ProjectCostManagement.DetermineBudget

class ManagementCostPayment {
    static belongsTo = [managementCostUse:ManagementCostUse]
    ManagementCostUse managementCostUse
    Date paymentDate
    BigDecimal price
    boolean isPayed
    String description
    static constraints = {
        paymentDate(blank:false)
        managementCostUse(blank:false)
        price(blank:false)
        isPayed()
        description(nullable:true,maxSize:500)
    }
    String  toString(){
        return "$managementCostUse|Payment = $price"
    }
    
    static printFields = ['manegementCostUse','price','paymentDate','isPayed','description']
      static mapping = {
        order  "asc"
        sort   "managementCostUse"
    }
}
