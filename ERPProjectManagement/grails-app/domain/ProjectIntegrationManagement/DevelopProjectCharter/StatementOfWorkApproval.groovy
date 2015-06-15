package ProjectIntegrationManagement.DevelopProjectCharter

class StatementOfWorkApproval {
    
    static belongsTo = 
        [
            ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister,
            StatementOfWork
        ]

    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder

    StatementOfWork statementOfWork

    String comments
    
    Date dateCreated
    
    Boolean approval
    
    static mapping = {
        autoTimestamp true
    }
    
    String toString(){
        return "$stakeholder :$statementOfWork :$approval"        
    }    
    static constraints = {
        statementOfWork()
        stakeholder()
        approval()        
        comments(nullable:true, maxSize:2000)        
    }
}
