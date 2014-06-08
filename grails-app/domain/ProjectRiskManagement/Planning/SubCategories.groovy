package ProjectRiskManagement.Planning

class SubCategories {
    String subCategories
    int ranking    
    static belongsTo=[riskCategories:RiskCategories]                
    String description
    double weight
    double kategori
    
    double getKategori(){
        return riskCategories.getWeight()
    }    
        
    static constraints = {
        subCategories(blank:false)
        riskCategories(nullable:true)
        ranking(blank:false)        
        description(blank:false,maxSize:500)
        
    }        
    String toString(){
        return "$ranking.$subCategories:$riskCategories"
    }                
    
    double getWeight(){        
        int n = SubCategories.countByRiskCategories(riskCategories)
        int a = this.ranking
        double hasil=0.0 
        for(i in a..n){
            hasil+= 1/i
        }
        hasil = hasil/n
       return hasil
    }      
    static transients=['weight','kategori']   

    
}