package ProjectTimeManagement.DefineActivity

class Task {
    static belongsTo =[
    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
    ]

    static hasMany = [
       activity:ProjectTimeManagement.DefineActivity.Activity
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork idProject
    String taskName;
    String descriptionOfWork;
    static constraints = {
        idProject()
        taskName(blank:false)
        descriptionOfWork(maxSize:1000, nullable:true)
        activity()
    }
    String toString(){
        return "$taskName"
    }
    static printFields = ['idProject','taskName','descriptionOfWork','activity']
}
