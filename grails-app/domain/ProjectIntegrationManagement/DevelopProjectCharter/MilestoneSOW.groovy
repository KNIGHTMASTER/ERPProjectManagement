package ProjectIntegrationManagement.DevelopProjectCharter

class MilestoneSOW {
    static belongsTo = 
    [
        projectName:StatementOfWork
    ]
    
    String milestoneName
    Date dueDate
    
    String toString(){
        return milestoneName
    }
    
    static constraints = {
        projectName()
        milestoneName(blank:false)
        dueDate()
    }
}
