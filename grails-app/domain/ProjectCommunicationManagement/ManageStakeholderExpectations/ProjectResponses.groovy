package ProjectCommunicationManagement.ManageStakeholderExpectations

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter

class ProjectResponses {
    ProjectCharter projectCharter
    StakeholderRegister stakeholder

    Double cost
    Double time

    static constraints = {
        projectCharter()
        stakeholder()
        cost()
        time()
    }
}
