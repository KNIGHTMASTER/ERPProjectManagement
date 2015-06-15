package ProjectIntegrationManagement.CloseProjectOrPhase

class PhaseRecord {
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]
    
    String projectSummary
    String transitionToOperation
    BigDecimal projectCost
    String projectSchedule
    String recommendations
    
    static hasMany = 
    [
        acceptance:RecordAcceptance
    ]
    
    static constraints = {
        projectName()
        projectSummary(maxSize:2000)
        transitionToOperation(maxSize:2000)
        projectCost()
        projectSchedule(maxSize:2000)
        recommendations(maxSize:2000)
        acceptance()
    }
}
