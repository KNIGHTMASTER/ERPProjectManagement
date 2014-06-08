package ProjectCommunicationManagement.IdentifyStakeholders

class StakeholderManagementStrategy {

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    String projectStatusControl
    String description

    static constraints = {
        projectName()
        projectStatusControl()
        description(maxSize: 2000)
    }
}
