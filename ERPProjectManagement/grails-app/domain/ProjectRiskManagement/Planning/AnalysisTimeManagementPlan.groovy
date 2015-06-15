package ProjectRiskManagement.Planning

class AnalysisTimeManagementPlan {
Date dateCreated
    static belongsTo=
    [
        identificationTimeManagementPlan:IdentificationTimeManagementPlan,
        subCategories:SubCategories
    ]    
    int ranking
    String description        
    double weight
    String rating
    double total
    double category
    double subKategori
    
    double getTotal(){
        double a=this.getCategory()*this.getSubKategori()*this.getWeight()
        return a
    }
    double getCategory(){
        return subCategories.getKategori()
    }
    
    double getSubKategori(){
        return subCategories.getWeight()
    }         
    String getRating(){
        return identificationTimeManagementPlan.getRisk()
    }                             
    static transients=['rating','weight','total','category','subKategori']
    static constraints = {
        identificationTimeManagementPlan(nullable:true)
        ranking(blank:false)
        subCategories(nullable:true)
        description(blank:false,maxSize:500)
        dateCreated()
    }   
    String toString(){
        return "$identificationTimeManagementPlan"
    }        
    double getWeight(){
        int n =AnalysisTimeManagementPlan.countBySubCategories(subCategories)
        int a = this.ranking
        double hasil 
        for(i in a..n){
            hasil+= 1/i
        }
        hasil = hasil/n
       return hasil
    }
}