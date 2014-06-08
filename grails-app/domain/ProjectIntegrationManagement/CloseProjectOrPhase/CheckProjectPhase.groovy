package ProjectIntegrationManagement.CloseProjectOrPhase

class CheckProjectPhase {

    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]
    
    String projectPhase
    
    static constraints = {
        projectName()
        projectPhase(inList:["phase", "project"])
    }
}
