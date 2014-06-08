package ProjectScopeManagement.CollectRequirements

class RequirementsManagementPlan {
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
        
    String requirementsCollection
    String categories
    String prioritization
    String traceability
    String configurationManagement
    String verification
    
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    String toString(){
        return "$categories"
    }
    
    static constraints = {
        projectName()
        requirementsCollection(maxSize:100000, nullable:true)
        categories(nullable:true)
        prioritization(maxSize:1000, nullable:true)
        traceability(maxSize:1000, nullable:true)
        configurationManagement(maxSize:1000, nullable:true)
        verification(maxSize:1000, nullable:true)
    }
}
