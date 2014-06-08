package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectCharterApproval {
    
    static belongsTo =
    [
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister,
        ProjectProposal,
        ProjectCharter
    ]

    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder
    ProjectProposal projectName
    ProjectCharter projectCharter
    
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    
    String toString(){
        return "${projectCharter} - ${stakeholder}:${projectCharter}"
    }
    
    Boolean acceptance
    
    String comments
    
    static constraints = {
        projectName()
        stakeholder()
        projectCharter()
        acceptance()
        comments(maxSize:2000)
    }
}
