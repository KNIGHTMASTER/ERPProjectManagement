package ProjectIntegrationManagement.DevelopProjectCharter

class MilestoneType {

    /*static belongsTo =     
    [
        projectType:ProjectType
    ]*/
    
    String milestone
    String description    
    
    String toString(){
        return milestone
    }    
    static constraints = {  
        //projectType()
        milestone()
        description(maxSize:2000)
    }
}
