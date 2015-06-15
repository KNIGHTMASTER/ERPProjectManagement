package ProjectScopeManagement.CreateWBS

class Wbs {
    
    Date dateCreated
    
    static mapping = {
        autoTimestamp true        
    }    
    
    static belongsTo =
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        milestoneType:ProjectIntegrationManagement.DevelopProjectCharter.MilestoneType,
        deliverable:ProjectScopeManagement.DefineScope.ProjectDeliverable
    ]
            
    String wbsName    

        
    String toString(){
        return "$wbsName"
    }
    

    
    static constraints = {
        projectName()
        milestoneType()
        deliverable()
        wbsName(blank:false)
    }
}
