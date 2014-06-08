package ProjectCostManagement.DetermineBudget

class MonthBudget {
    static belongsTo = [budget : Budget]
    Budget budget
    Date startDate
    Date endDate
    String note
    BigDecimal income
    BigDecimal human
    BigDecimal material
    BigDecimal management
    BigDecimal outcome
    BigDecimal balance
    BigDecimal ocm
    static transients = ['income','human','material','management','outcome','balance', 'ocm']
    BigDecimal getOcm(){
        this.getOutcome()
    }
    BigDecimal getIncome(){
        def project = budget.project
        def payment = ProjectIntegrationManagement.DevelopProjectCharter.Payment.createCriteria()
        def pay = payment.get{
            and {
                eq('projectName',project)
            }
            projections {
                sum('cost')
            }
        }
        pay?:0
        return pay
    }    
    BigDecimal getHuman(){
        def project = budget.project
        def tot = 0
        def s = SalaryHumanResource.createCriteria()
        def sal = s.list{
            and{
                eq('isPayed',true)
                between('paymentDate',startDate,endDate)
            }
        }
        if(sal)
        sal.each{
            if(it.humanResourceCost.activityCost.cost.project.id==project.id)
            tot+=it.normalCost
        }
        tot?:0
    }
    BigDecimal getMaterial(){
        def project = budget.project
        def tot = 0
        def m = MaterialCostPayment.createCriteria()
        def mat = m.list{
            and{
                between('paymentDate',startDate,endDate)
                eq('isPayed',true)
            }
        }
        mat.each{
            if(it.materialCost.cost.project.id==project.id)
            tot+=it.total
        }
        tot?:0
    }
    BigDecimal getManagement(){
        def project = budget.project
        def tot = 0
        def ma = ManagementCostPayment.createCriteria()
        def man = ma.list{
            and{
                between('paymentDate',startDate,endDate)
                eq('isPayed',true)
            }
        }
        man.each{
            if(it.managementCostUse.managementCostActivity.cost.project.id==project.id)
            tot+=it.price
        }
        tot?:0
    }
    BigDecimal getOutcome(){
        outcome = this.getHuman()+this.getMaterial()+this.getManagement() + (this.getIncome()*0.01)
        return outcome
    }
    
    BigDecimal getBalance(){
         balance = this.getIncome() - this.getOutcome()
         return balance
    }

    static constraints = {
        budget(blank:false)
        startDate(blank:false)
        endDate(blank:false)
        note(nullable:true,maxSize:500)
    }
    String toString(){
        return "$startDate"
    }
}