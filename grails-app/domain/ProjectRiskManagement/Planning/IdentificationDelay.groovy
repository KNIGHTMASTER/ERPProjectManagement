package ProjectRiskManagement.Planning
import ProjectTimeManagement.DefineActivity.DelayActivity;
class IdentificationDelay {
    static belongsTo=
    [
        delayActivity:ProjectTimeManagement.DefineActivity.DelayActivity,
        riskCategories:RiskCategories
    ]
    String description
    int ambil
    String risk
    int getAmbil(){
        return delayActivity.getDifference()
    }
    static transients =['ambil','risk']
    String getRisk(){
        if (this.getAmbil()>60){
            return "Very High"
        } else if (this.getAmbil()>30 && this.getAmbil()<=60){
            return "High"
        } else if (this.getAmbil()>15 && this.getAmbil()<=30){
            return "Medium"
        } else if (this.getAmbil()>=1 && this.getAmbil()<=15){
            return "Low"
        } else if (this.getAmbil()<1){
            return "Very Low"
        }
        else{
            return "Wrong"
        }        
    }    
    
    static constraints = {
        delayActivity(nullable:true)
        riskCategories(nullable:true)
        description(blank:false,maxSize:500)
    }
}