package ProjectIntegrationManagement.DevelopProjectCharter

class AcceptanceCriteria {
    
    Date dateAcceptance
    String methodOfAcceptance    
    
    static belongsTo = 
    [
        StatementOfWork,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister authority
    StatementOfWork projectName

    String toString(){
        return methodOfAcceptance
    }
    static constraints = {
        projectName()
        dateAcceptance()
        methodOfAcceptance()
        authority()
    }
}
