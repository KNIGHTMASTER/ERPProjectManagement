package ProjectScopeManagement.DefineScope

class ProjectDeliverable {
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectIntegrationManagement.DevelopProjectCharter.Milestones
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectIntegrationManagement.DevelopProjectCharter.Milestones milestones

    String toString(){
        return deliverable
    }

    static mapping = {
        order  "asc"
        sort   "milestones"
    }
    String deliverable;
    
    static constraints = {
        projectName()
        milestones()
        deliverable()
    }
}
