package ProjectIntegrationManagement.DevelopProjectManagementPlan

class ProjectManagementPlanAcceptance {
    
    static mapping = {
        autoTimestamp true
    }
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder

    Boolean acceptance
    String comments
    Date dateCreated

    String toString(){
        return "${stakeholder}:${acceptance}"
    }
    
    Boolean getAcceptance(){
        return acceptance
    }
    
    static constraints = {
        projectName()
        stakeholder()
        acceptance()
        comments(maxSize:1000)
    }
}
