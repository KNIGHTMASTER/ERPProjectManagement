package ProjectScopeManagement.CollectRequirements

class RelationshipTraceability {
   
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        requirementsTraceabilityMatrix:RequirementsTraceabilityMatrix
    ]
        
    String relatesToObjectives
    String manifestInWBSDeliverable
    String verification
    String validation
    
    static constraints = {
        projectName()
        requirementsTraceabilityMatrix()
        relatesToObjectives()
        manifestInWBSDeliverable()
        verification()
        validation()
    }
}
