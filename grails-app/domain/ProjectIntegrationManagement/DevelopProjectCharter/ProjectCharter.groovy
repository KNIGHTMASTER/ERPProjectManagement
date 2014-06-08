package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectCharter {

    static hasMany =
    [
            milestones:Milestones,
        payment:Payment,
        projectCharterApprovals:ProjectCharterApproval
    ]

    static mapping = {
        autoTimestamp(true)
    }
    Date dateCreated

    static belongsTo = 
    [
        ProjectProposal
    ]

    ProjectProposal projectName

    String toString(){
        return "${projectName}"
    }
    
    //init dari user langsung
    String projectPurpose
    String projectDescription
    String projectScope
    String acceptanceCriteria
    String initialRisk
    int EstimatedBudget //dapat dari cost management    
    String projectManagerAuthority
        
    static constraints = {        
        projectName(unique: true)
        payment()
        projectPurpose(maxSize:2000)
        projectDescription(maxSize:2000)
        projectScope(maxSize:2000)
        acceptanceCriteria(maxSize:2000)
        initialRisk(maxSize:1000)       
        estimatedBudget()
        projectManagerAuthority(maxSize:2000)
    }
}
