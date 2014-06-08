package ProjectCommunicationManagement.DistributeInformation

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
import ProjectTimeManagement.DefineActivity.ActivityTracking

class DistributeInformation {
    ProjectCharter projectCharter
    ActivityTracking activityTracking

    static hasMany = [
        stakeholder: StakeholderRegister
    ]

    String summary
    String workPlannedLastActivity
    String workPlannedNextActivity
    String openIssues
    String openRisks
    Boolean distribute

    static constraints = {
        projectCharter()
        activityTracking()
        stakeholder()
        summary(maxSize: 2000)
        workPlannedLastActivity(maxSize: 1000)
        workPlannedNextActivity(maxSize: 1000)
        openIssues(maxSize: 1000)
        openRisks(maxSize: 1000)
        distribute()
    }
}
