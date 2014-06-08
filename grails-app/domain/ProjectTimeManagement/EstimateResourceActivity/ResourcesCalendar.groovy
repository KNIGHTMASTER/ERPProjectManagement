package ProjectTimeManagement.EstimateResourceActivity

class ResourcesCalendar {
static belongsTo = [
                    employee:ProjectHumanResourceManagement.Employee
                   ]
Date activeDate
Date inactiveDate
    static constraints = {
        employee(blank:false)
        activeDate(blank:false)
        inactiveDate(blank:false)
    }
    static mapping = {
        sort   "employee"
        order  "asc"
        
    }
    String toString(){
        return "$employee: $activeDate - $inactiveDate"
    }
}