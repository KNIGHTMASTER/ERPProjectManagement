package ProjectIntegrationManagement.CloseProjectOrPhase

class RecordAcceptance {
    
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister name

    Boolean acceptance
    String comments        
    
    static constraints = {
        projectName()
        name()
        acceptance()
        comments(maxSize:1000)
    }
}
