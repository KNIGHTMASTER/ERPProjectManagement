package ProjectIntegrationManagement.PerformIntegratedChangeControl

class ChangeBoardApproval {

    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ChangeRequest,
        ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ChangeRequest changeRequest
    ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard peopleWhoApprove

    Boolean acceptance
    String comments

    static constraints = {
        projectName()
        changeRequest()
        peopleWhoApprove()
        acceptance()
        comments()
    }
}
