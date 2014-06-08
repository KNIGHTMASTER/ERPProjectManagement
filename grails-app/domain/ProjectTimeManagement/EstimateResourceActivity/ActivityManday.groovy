package ProjectTimeManagement.EstimateResourceActivity

class ActivityManday {
    static belongsTo = [
            activity:ProjectTimeManagement.DefineActivity.Activity,
            employee:ProjectHumanResourceManagement.Employee
    ]
    ProjectTimeManagement.DefineActivity.Activity    activity
    ProjectHumanResourceManagement.Employee          employee
    String      doWork
    String      description
    Date        date
    Date        startWorks
    Date        endWorks
    boolean     active

    static constraints = {
        date()
        activity(blank:false)
        employee(blank:false)
        doWork(nullable:true)
        description(nullable:true,maxSize:500)
        startWorks(nullable:true)
        endWorks(nullable:true)
        active(nullable:true)
    }
    String  toString(){
        return "$employee: $doWork"
    }
    static mapping = {
        order  "asc"
        sort   "activity"
    }
    static printFields = ['date','activity','employee','active','doWork','description','startWorks','endWorks']
}