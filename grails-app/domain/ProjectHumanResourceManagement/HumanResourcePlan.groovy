package ProjectHumanResourceManagement

class HumanResourcePlan {
    
    static belongsTo = 
    [
        activity:ProjectTimeManagement.DefineActivity.Task
    ]
    
    Employee leader
    
    static hasMany = 
    [
        teams:Employee
    ]
    
    static constraints = {
    }
}
