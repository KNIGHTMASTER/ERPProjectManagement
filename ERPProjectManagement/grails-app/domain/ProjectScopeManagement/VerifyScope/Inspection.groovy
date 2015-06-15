package ProjectScopeManagement.VerifyScope

class Inspection {

    static mapping = {
        autoTimestamp true
        order("asc")
        sort("deliverable")
    }

    
    static belongsTo =
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectScopeManagement.DefineScope.ProjectDeliverable
    ]

    Date dateCreated

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectScopeManagement.DefineScope.ProjectDeliverable deliverable
    String realization
    String decision

    String toString(){
        return "${deliverable} : ${decision} with realization ${realization}"
    }

    static constraints = {
        projectName()
        deliverable()
        decision(inList:["Accepted", "Change Request"])
        realization(maxSize: 1000, nullable:true)
    }
}
