package ProjectCommunicationManagement.PlanCommunications

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRoles

class CommunicationManagementPlan {
    static belongsTo = [
            ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
            ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard
    ]

    static hasMany = [
            stakeholderRoles: StakeholderRoles,
            projectTeamDirectory: ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard changeControlBoard

    String introduction
    String communicationManagementApproach
    String communicationManagementConstraints
    String stakeholderCommunicationRequirements
    String communicationMethodsAndTechnologies

    String toString(){
        return "Communication Plan Project ${projectName}"
    }

    static constraints = {
        projectName()
        introduction(maxSize: 2000)
        communicationManagementApproach(maxSize: 2000)
        communicationManagementConstraints(maxSize: 2000)
        stakeholderCommunicationRequirements(maxSize: 2000)
        stakeholderRoles()
        projectTeamDirectory()
        communicationMethodsAndTechnologies(maxSize: 2000)
    }

}
