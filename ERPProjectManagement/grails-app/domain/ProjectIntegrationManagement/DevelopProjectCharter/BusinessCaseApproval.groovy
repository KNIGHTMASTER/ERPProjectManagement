package ProjectIntegrationManagement.DevelopProjectCharter

class BusinessCaseApproval {
        
    static belongsTo = [
        BusinessCase,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    BusinessCase projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder

    String comments
    
    Date dateCreated
    
    Boolean approval
    
    static mapping = {
        autoTimestamp true
    }
    
    String toString(){
        return "$stakeholder :$projectName :$approval"
    }
    static constraints = {
        projectName()
        stakeholder()
        approval()
        comments(maxSize:2000)
    }
}
