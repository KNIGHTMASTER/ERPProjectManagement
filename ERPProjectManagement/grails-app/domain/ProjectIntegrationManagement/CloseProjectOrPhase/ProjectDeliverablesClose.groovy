package ProjectIntegrationManagement.CloseProjectOrPhase

class ProjectDeliverablesClose {

    static belongsTo = [        
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        projectRecord:ProjectRecord,
        plannedDeliverable:ProjectScopeManagement.DefineScope.ProjectDeliverable,
        milestone:ProjectIntegrationManagement.DevelopProjectCharter.Milestones  
    ]

    String status
    static constraints = {
        projectName()
        milestone(blank:false)
        plannedDeliverable(blank:false)
        status(blank:false, inList:['Delivered', 'Not Delivered'])
    }
    
    String toString(){
        return "Milestone:$milestone:$plannedDeliverable:$status"
    }    
}
