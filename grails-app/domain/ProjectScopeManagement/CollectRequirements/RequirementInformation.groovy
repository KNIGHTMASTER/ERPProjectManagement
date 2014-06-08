package ProjectScopeManagement.CollectRequirements

class RequirementInformation {
    
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        requirementsTraceabilityMatrix:RequirementsTraceabilityMatrix
    ]
    
    String requirement
    String priority
    String category
               
    String toString(){
        return projectName
    }
    
    static constraints = {
        projectName()
        requirementsTraceabilityMatrix()
        requirement()
        priority()
        category()
    }
}
