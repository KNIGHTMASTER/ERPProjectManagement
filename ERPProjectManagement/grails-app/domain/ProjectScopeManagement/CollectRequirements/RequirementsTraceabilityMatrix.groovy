package ProjectScopeManagement.CollectRequirements

class RequirementsTraceabilityMatrix {    
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter    
    ]
    
    static hasMany =
    [        
        requirementInformation:RequirementInformation, 
        relationshipTraceability:RelationshipTraceability        
    ]
    
    String toString(){
        return "$projectName"
    }
    
    static constraints = {
        projectName()
        requirementInformation()
        relationshipTraceability()
    }
}
