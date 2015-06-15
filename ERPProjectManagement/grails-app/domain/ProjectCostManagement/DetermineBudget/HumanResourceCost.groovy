package ProjectCostManagement.DetermineBudget

class HumanResourceCost {
    static belongsTo = [activityCost : ActivityCost, employee : ProjectHumanResourceManagement.Employee]
    static hasMany = [salaryHumanResource : SalaryHumanResource]
    int day
    int actualDay
    BigDecimal normalCost
    BigDecimal normalActualCost
    BigDecimal salary
    boolean approve
    String  idx
    static transients = ['day','actualDay','salary','normalCost','normalActualCost']
    int getDay(){
        def d    = ProjectTimeManagement.EstimateResourceActivity.ActivityManday.createCriteria()
        def act  = activityCost.activity
        def days = d.get{
                and{
                    eq("activity",act)
                    eq("employee",this.employee)
                }
                projections {
				  rowCount()
                            }
        }
        days?:0
    }

    int getActualDay(){
        def d    = ProjectTimeManagement.EstimateResourceActivity.ActivityManday.createCriteria()
        def act  = activityCost.activity
        def days = d.list{
                and{
                    eq("activity",act)
                    eq("employee",this.employee)
                }
        }
        def t=0
        if(days)
        days.each{
            if(it.active==true)
            t+=1
        }
        t?:0
    }
    BigDecimal getSalary(){
        def s = ProjectHumanResourceManagement.Salary.createCriteria()
        def salar = s.get{
            and{
                eq("employee",this.employee)
                eq("active",true)
            }
            projections {
                sum("value")
            }
        }
        salar?:0
    }

    BigDecimal getNormalCost(){
        BigDecimal normal = (getDay()*getSalary()) as BigDecimal
        normal?:0
    }

    BigDecimal getNormalActualCost(){
        BigDecimal normal = (getActualDay()*getSalary()) as BigDecimal
        normal?:0
    }
    static constraints = {
        activityCost(blank:false)
        employee(blank:false)
        idx(blank:false,unique:true)
        approve()
    }

    static printFields = ['activityCost','employee','salary','day','overday','total']
    String  toString(){
        return "$activityCost: $employee"
    }

    static mapping = {
        activityCost lazy : false
        order  "asc"
        sort   "activityCost"
    }
}