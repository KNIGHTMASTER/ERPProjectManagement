package ProjectCostManagement.DetermineBudget

class Cost {
    static belongsTo = 
        [
            project : ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
        ]
    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter project
    static hasMany = 
        [
            humanCost:ProjectCostManagement.DetermineBudget.ActivityCost,
            materialCost:ProjectCostManagement.DetermineBudget.MaterialCostActivity,
            managementCost:ProjectCostManagement.DetermineBudget.ManagementCostActivity
        ]
    ProjectCostManagement.DetermineBudget.CostManagementPlan costProject = new ProjectCostManagement.DetermineBudget.CostManagementPlan()
    String description
    BigDecimal value
    BigDecimal human
    BigDecimal material
    BigDecimal management
    BigDecimal profit

    static constraints = {
        costProject(blank:false)
        description(nullable:true,maxSize:500)
    }
    static transients = ['value','human','material','management','profit']
    BigDecimal getValue(){
        return costProject.plannedValue
    }
    BigDecimal getHuman(){
        def hrCost = HumanResourceCost.executeQuery("select t from HumanResourceCost t where t.activityCost in (select a.id from ActivityCost a where a.cost=${this.id})")
        if (hrCost){
            def tot=0
            hrCost.each{
                if(it.normalCost)
                tot+=it.normalCost
            }
           tot?:0
        }
        else return 0
    }
    BigDecimal getMaterial(){
        def m = MaterialCostActivity.executeQuery("select t from MaterialCostActivity t where t.cost=${this.id}")
        def t = 0
        m.each{
            t+= it.total
        }
        m?t:0
    }
    BigDecimal getManagement(){
        def n = ManagementCostActivity.executeQuery("select sum(t.price) from ManagementCostActivity t where t.cost=${this.id}")
        n?n[0]:0
    }
    BigDecimal getProfit(){
        BigDecimal h = this.getHuman()?:0
        BigDecimal m = this.getMaterial()?:0
        BigDecimal n = this.getManagement()?:0
        BigDecimal v = this.getValue()?:0
        BigDecimal p = v-h-m-n
        p?:0
    }
    static printFields = ['project','costProject','value','human','material','management','profit']
    String  toString(){
        return "$costProject"
    }
}
