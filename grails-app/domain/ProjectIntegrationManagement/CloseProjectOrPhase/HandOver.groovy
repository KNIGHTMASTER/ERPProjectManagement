package ProjectIntegrationManagement.CloseProjectOrPhase

class HandOver {
    
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]
    
    String handOverMethod
    
    static hasMany = 
    [
        acceptances:HandOverAcceptance
    ]
    
    static constraints = {
        projectName()
        handOverMethod()
        acceptances()
    }
}
