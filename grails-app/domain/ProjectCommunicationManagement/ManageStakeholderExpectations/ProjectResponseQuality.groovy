package ProjectCommunicationManagement.ManageStakeholderExpectations

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
import ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter

class ProjectResponseQuality {
    ProjectCharter projectCharter
    StakeholderRegister stakeholder

    Double quality
    Double scope

    static constraints = {
        projectCharter()
        stakeholder()
        quality()
        scope()
    }
}
