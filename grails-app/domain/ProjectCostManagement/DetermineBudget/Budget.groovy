package ProjectCostManagement.DetermineBudget

class Budget {
    static belongsTo = 
        [
            project : ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
        ]
    static hasMany = [monthBudget : MonthBudget]
    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter project
    String note
    BigDecimal income
    BigDecimal  human
    BigDecimal  material
    BigDecimal  management
    BigDecimal  outcome
    BigDecimal  balance
    static transients = ['income','human','material','management','outcome','balance', 'inc']  
    static constraints = {
        project(unique:true,blank:false)
        note(nullable:true,maxSize:500)
    }
    BigDecimal getIncome(){
        def payment = ProjectIntegrationManagement.DevelopProjectCharter.Payment.createCriteria()
        def pay = payment.get{
            and {
                eq('projectName',this.project)
            }
            projections {
                sum('cost')
            }
        }
        pay?:0
        return pay
    }
    BigDecimal getInc(){
        this.getIncome()
    }
    BigDecimal getHuman(){
        def tot = 0
        def s = SalaryHumanResource.createCriteria()
        def sal= s.list{
            and {
                eq('isPayed',true)
            }
        }
        if(sal)
        sal.each{
            if (it.humanResourceCost.activityCost.cost.project.id==project.id)
            tot+=it.normalCost
        }
        tot?:0
    }
    BigDecimal getMaterial(){
        def m = MaterialCostPayment.createCriteria()
        def tot = 0
        def mat = m.list{
            and {
                eq('isPayed',true)
            }
        }
        mat.each{
            if (it.materialCost.cost.project.id==project.id)
            tot+=it.total
        }
        tot?:0
    }
    BigDecimal getManagement(){
        def tot = 0
        def ma = ManagementCostPayment.createCriteria()
        def man = ma.list{
             and {
                eq('isPayed',true)
            }
        }
        man.each{
            if (it.managementCostUse.managementCostActivity.cost.project.id==project.id)
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
    String toString(){
        return "$project"
    }
    static printFields = ['project','income','outcome','balance','note']
}