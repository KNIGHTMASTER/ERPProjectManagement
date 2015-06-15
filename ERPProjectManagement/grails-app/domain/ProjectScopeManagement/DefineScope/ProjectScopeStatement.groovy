package ProjectScopeManagement.DefineScope

class ProjectScopeStatement {
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    static hasMany = 
    [
        projectDeliverables:ProjectDeliverable,
        //qualitative:ProjectRiskManagement.Qualitative
    ]
    
    String toString(){
        return "$projectName"
    }
            
    String productScopeDescription    
    String projectAcceptanceCriteria
    String projectExclusions
    String projectConstraints
    String projectAssumptions
    
    static constraints = {
        projectName()        
        productScopeDescription(maxSize:1000)
        projectAcceptanceCriteria(maxSize:1000)
        projectExclusions(maxSize:1000)
        projectConstraints(maxSize:1000)
        projectAssumptions(maxSize:1000)
        projectDeliverables()
    }
}
