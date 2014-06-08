package ProjectRiskManagement.Planning

class RiskCategories {
    static belongsTo=[projectCharter:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter]
    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectCharter

    String riskCategories
    int ranking    
    String description
    static constraints = {
        projectCharter(nullable:true)
        riskCategories(nullable:true,inList:["Cost","Time","Scope","QualityRange"])
        ranking(blank:false)
        description(blank:false,maxSize:500)
    }
    String toString(){
        return "$ranking. $riskCategories : $projectCharter"
    }        
    double weight
    double getWeight(){
        int n=RiskCategories.countByProjectCharter(projectCharter)
        int x=this.ranking
        double hasil
        for(i in x..n){
            hasil+=1/i
        }
        hasil=hasil/n
        return hasil
    }
   static transients=['weight']
}