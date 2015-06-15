package ProjectIntegrationManagement.DevelopProjectCharter

class TaskSOW {
    static belongsTo = 
    [
        projectName:StatementOfWork,
        workRequirement:WorkRequirements,
    ]
    
    String task
    String description
    static constraints = {
        projectName()
        workRequirement()
        task()
        description(maxSize:1000)
        
    }
}
