package ProjectIntegrationManagement.DevelopProjectManagementPlan

class DefinitionsOfChange {
    
    String scheduleChange
    String budgetChange
    String scopeChange
    String projectDocumentChanges
    
    static belongsTo = 
    [
        ChangeManagementPlan
    ]

    ChangeManagementPlan changeManagementPlan
    static constraints = {
        changeManagementPlan(unique:true)
        scheduleChange(maxSize:1000)
        budgetChange(maxSize:1000)
        scopeChange(maxSize:1000)
        projectDocumentChanges(maxSize:1000)
    }
}
