package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectProposal {    
    String priorityOfTheProject    
    String projectDescription
    Date requestedStartDate
    Date requestedCompletionDate        
    BigDecimal plannedBudget
    Date dateCreated
    String scale
    static mapping = {
        autoTimestamp true
    }        
    
    static belongsTo = 
    [
        StatementOfWork,
        ProjectType
    ]

    StatementOfWork projectName
    ProjectType projectType

    String toString(){
        return "$projectName"
    }
    
    static transients = ['scale']
    
    String getScale(){
        if(plannedBudget<75000000){
            return "Low"
        }else if(plannedBudget>=75000000 && plannedBudget<=150000000){
            return "Moderate"
        }else if(plannedBudget>150000000 && plannedBudget<=300000000){
            return "High"
        }else if(plannedBudget>300000000){
            return "Enterprise"
        }else{
            return "Other"
        }        
    }

    /*static  hasMany = [
        businessCases:BusinessCase
    ]*/

    static constraints = {           
        projectName(unique:true)
        plannedBudget()
        priorityOfTheProject(inList: ["Normal", "Express"], blank:false)        
        projectDescription(maxSize:2000)
        requestedStartDate()
        requestedCompletionDate()
        projectType()
        //projectScale()        
    }
}
