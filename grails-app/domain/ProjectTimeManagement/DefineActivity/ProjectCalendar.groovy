package ProjectTimeManagement.DefineActivity

class ProjectCalendar {
static belongsTo = [project:ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork]
    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork project
    Date date
    String dayType
    int workTime
    boolean active
    String description

    static constraints = {
        project(blank:false)
        date(blank:false)
        dayType(blank:false)
        workTime(nullable:true,range:0..24)
        active()
        description(nullable:true) 
    }
    static printFields = ['project','date','dayType','workTime','active','description']
    
    String toString(){
            return "$project|$date:$dayType"
        }
        static mapping = {
        order  "asc"
        sort   "date"
    }
}
