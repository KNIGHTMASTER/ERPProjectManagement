package ProjectIntegrationManagement.DirectAndManageProjectExecution

class WorkPerformanceInformation {
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        activity:ProjectTimeManagement.DefineActivity.ActivityTracking
    ]
    
    static hasMany = 
    [
        //projectStatus:ProjectStatus
    ]
    
    Date dateEnding
    String workPlannedLastStep
    String workCompletedLastStep
    String workPlannedNextStep
    
    String toString(){
        return projectName
    }
    
    static constraints = {
        projectName()
        dateEnding()
        workPlannedLastStep(maxSize:1000)
        workCompletedLastStep(maxSize:1000)
        workPlannedNextStep(maxSize:1000)
        //projectStatus()
    }
}
