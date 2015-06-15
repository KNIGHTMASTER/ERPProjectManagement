package ProjectIntegrationManagement.DevelopProjectManagementPlan

class RequestProjectManagementPlan {

    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    String functionalPlan;
    String message
    Boolean request;
    
    static constraints = {
        projectName()
        functionalPlan(
            inList:
            [
                "Scope Management Plan",
                "Time Management Plan", 
                "Cost Management Plan", 
                "Risk Management Plan", 
                "Procurement Management Plan",
                "Human Resource Management Plan",
                "Communication Management Plan"
            ]
        )
        message(maxSize:2000)
        request()
    }
}
