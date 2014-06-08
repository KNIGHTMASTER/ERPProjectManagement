package ProjectIntegrationManagement.DevelopProjectManagementPlan

class ChangeManagementPlan {
     static mapping = {
        autoTimestamp true
    }
    
    static hasMany = 
    [
        definitionsOfChange:DefinitionsOfChange,
        //developProjectManagementPlan:ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan,
        changeControlBoard:ChangeControlBoard
    ]

     
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    String changeManagementApproach    
    Date datePrepared
    
    
    String toString(){
        return "$projectName"
    }
    
    static constraints = {
        projectName(unique:true)
        changeManagementApproach(maxSize:2000)
        changeControlBoard()
    }
}
