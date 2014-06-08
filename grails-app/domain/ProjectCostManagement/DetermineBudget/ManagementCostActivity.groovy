package ProjectCostManagement.DetermineBudget

class ManagementCostActivity {
    static belongsTo = [cost : Cost]
    static hasMany = [managementCostUse : ManagementCostUse]
    String detail
    BigDecimal price
    Date startDate
    Date endDate
    String description
    boolean approve
    BigDecimal earnedValue
    BigDecimal actualCost
    static transients = ['earnedValue','actualCost', 'ev', 'ac']
    BigDecimal getEarnedValue(){
        def use = ManagementCostUse.executeQuery("select sum(t.price) from ManagementCostUse t where t.managementCostActivity=${this.id} and isUsed=true")
        if(use[0]==null) use=0
        use?use[0]:0
      }
    BigDecimal getActualCost(){
        def payment = ManagementCostPayment.executeQuery("select sum(t.price) from ManagementCostPayment t where t.managementCostUse in(select u.id from ManagementCostUse u where u.managementCostActivity=${this.id}) and isPayed=true")
        if(payment[0]==null) payment=0
        payment?payment[0]:0
      }
      
    BigDecimal getEv(){
        this.getEarnedValue()
    }

    BigDecimal getAc(){
        this.getActualCost()
    }

    
    static constraints = {
        cost(blank:false)
        detail(blank:false)
        price(blank:false)
        startDate(nullable:true)
        endDate(nullable:true)
        description(nullable:true,maxSize:500)
    }
   String toString(){
        return "$cost|$detail: $price"
    }
 
   static printFields = ['cost','detail','price','startDate','endDate','description']
      static mapping = {
        order  "asc"
        sort   "cost"
    }
}