package ProjectIntegrationManagement.DirectAndManageProjectExecution

class ProjectStatus {
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        workPerformanceInformation:WorkPerformanceInformation
    ]
    
    String toString(){
        return projectName
    }
    
    String item
    int bad
    int good
    int excellent
    
    static constraints = {
        projectName()
        workPerformanceInformation()
        item()
        bad()
        good()
        excellent()
    }
}
