package ProjectCostManagement.DetermineBudget

class MaterialCostPayment {
    static belongsTo = [materialCost : MaterialCostActivity]
    int amount
    Date paymentDate
    boolean isPayed
    BigDecimal price
    BigDecimal total
    static transients = ['price','total']
    BigDecimal getPrice(){
        def mtr = materialCost.price
    }
    BigDecimal getTotal(){
        this.amount * this.getPrice()
    }
    static constraints = {
        paymentDate(blank:false)
        amount(nullAble:true)
        isPayed()
    }

    static printFields = ['paymentDate','amount','price','total','isPayed']
     String  toString(){
        return "$paymentDate: $amount"
    }
}
