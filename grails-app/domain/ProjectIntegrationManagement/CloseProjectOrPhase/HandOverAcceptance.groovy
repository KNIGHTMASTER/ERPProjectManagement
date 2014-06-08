package ProjectIntegrationManagement.CloseProjectOrPhase

class HandOverAcceptance {

    Date dateCreated
    
    static mapping = 
    {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        name:ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]
    
    Boolean acceptance
    String comments
        
    static constraints = {
        projectName()
        name()
        acceptance()
        comments(maxSize:1000)
    }
}
