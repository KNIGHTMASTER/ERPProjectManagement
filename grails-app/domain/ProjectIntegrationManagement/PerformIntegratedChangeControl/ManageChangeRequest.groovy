package ProjectIntegrationManagement.PerformIntegratedChangeControl

import ProjectScopeManagement.ControlScope.VarianceAnalysis

class ManageChangeRequest {
    
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    static hasMany = [
        peopleWhoApprove:ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard,
        changeRequests:ChangeRequest,
        varianceAnalysis:VarianceAnalysis
    ]

    Boolean approval    
    String comments
    String recommendedAction
    Date dateRequested
    Date dateApproved
    
    static constraints = {
        projectName()
        peopleWhoApprove(nullable:true)
        changeRequests()
        varianceAnalysis()
        dateRequested()
        dateApproved()
        approval(nullable:true)
        comments(nullable:true, maxSize:2000)
        recommendedAction(nullable:true, maxSize:2000)
    }
}
