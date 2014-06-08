package ProjectCostManagement.DetermineBudget
import groovy.time.*
class SalaryHumanResource {
    static belongsTo = [humanResourceCost : HumanResourceCost]
    HumanResourceCost humanResourceCost
    Date paymentDate
    boolean isPayed
    BigDecimal salary
    int day
    BigDecimal normalCost
    static transients = ['salary','day','normalCost','overDay','overCost','total']
    BigDecimal getSalary(){
        return humanResourceCost?.salary?:0
    }
    int getDay(){
        def emp  = humanResourceCost.actualDay
    }
    BigDecimal getNormalCost(){
        BigDecimal normal = (getDay()*getSalary()) as BigDecimal
        normal?:0
    }
    static constraints = {
        humanResourceCost(blank:false)
        paymentDate(blank:false)
        isPayed()
    }
    String toString(){
        return "$humanResourceCost | $paymentDate : $total"
    }
    static printFields = ['paymentDate','humanResourceCost','day','salary','overDay','total','isPayed']
    static mapping = {
        sort paymentDate:"desc"
    }
}