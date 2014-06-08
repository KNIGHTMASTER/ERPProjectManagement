package ProjectTimeManagement.DevelopSchedule

class TimeApproval {
    
    static belongsTo = [
                        activity:ProjectTimeManagement.DefineActivity.Activity,
                        role:ProjectHumanResourceManagement.Employee
                       ]
    Boolean accepted
    String comment
    
    static constraints = {
        activity(blank:true)
        accepted()
        comment(nullable:true)
    }
    String toString(){
        return"$accepted"
    }
}
