package ProjectRiskManagement.Planning
import ProjectTimeManagement.DefineActivity.Activity;

class IdentificationTimeManagementPlan {
static belongsTo=
    [
        activity:ProjectTimeManagement.DefineActivity.Activity,
        riskCategories:RiskCategories
    ]    
    String description
    
    int time                                
    String risk
    int getTime(){
        return activity.duration
    }    
    String getRisk(){
        if (this.getTime()>120){
            return "Very High"
        } else if (this.getTime()>60 && this.getTime()<=120){
            return "High"
        } else if (this.getTime()>30 && this.getTime()<=60){
            return "Medium"
        } else if (this.getTime()>=1 && this.getTime()<=30){
            return "Low"
        } else if (this.getTime()<1){
            return "Very Low"
        }
        else{
            return "Wrong"
        }        
    }    
    static transients=['risk','time']
    
    static constraints = {
        activity(nullable:true)
        riskCategories(nullable:true)
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$activity"
    }
}