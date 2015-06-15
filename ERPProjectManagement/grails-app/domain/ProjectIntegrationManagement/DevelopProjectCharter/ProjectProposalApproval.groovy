package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectProposalApproval {
    static belongsTo = 
    [
        stakeholder:ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister,        
        projectName:ProjectProposal
    ]
    
    Boolean approval
    
    String comments
    
    Date dateCreated

    static mapping = {
        autoTimestamp true
    }

    String toString(){
        return "$stakeholder:$projectName"
    }
    
    static constraints = {
        projectName()
        stakeholder()
        dateCreated()        
        approval()
        comments(maxSize:2000)
    }
}
