package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectAcceptance {

    Boolean acceptance
    String comments
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    static belongsTo = 
    [
        ProjectProposal,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectProposal projectName

    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder
    
    String toString(){
        return acceptance
    }
    
    Boolean getAcceptance(){
        return acceptance
    }
    
    static constraints = {
        projectName()
        stakeholder(nullable:true)
        acceptance()
        comments(maxSize:1000)        
    }
}
