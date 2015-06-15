package ProjectCostManagement.DetermineBudget

class MaterialCostUse {
    static belongsTo = [materialCostActivity : MaterialCostActivity ]
    static hasMany = [materialCostPayment : MaterialCostPayment]
        int amount
        Date usedDate
        boolean isUsed
        BigDecimal price
        BigDecimal total
    static transients = ['price','total']
    BigDecimal getPrice(){
        def mtr = materialCostActivity.price
    }
    BigDecimal getTotal(){
        this.amount * this.getPrice()
    }
    static constraints = {
        usedDate(blank:false)
        amount(nullAble:true)
        isUsed()
    }

    static printFields = ['usedDate','amount','price','total','isUsed']
     String  toString(){
        return "$materialCostActivity: $amount"
    }
    static mapping = {
       order  "asc"
       sort  "usedDate"
    }
}
