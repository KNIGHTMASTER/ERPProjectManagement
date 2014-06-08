package ProjectRiskManagement.Planning

class AnalysisCostManagementPlan {
Date dateCreated
    static belongsTo=
    [
        identificationCostManagementPlan:IdentificationCostManagementPlan,
        subCategories:SubCategories
    ]    
    int ranking
    String description
    
    String rating
    double weight
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
        return identificationCostManagementPlan.getRisk()
    }             
    
    static transients=['rating','weight','total','category','subKategori']
    static constraints = {
        identificationCostManagementPlan(nullable:true)
        ranking(blank:false)
        subCategories(nullable:true)
        description(blank:false,maxSize:500)
        dateCreated()
    }
    String toString(){
        return "$identificationCostManagementPlan"
    }    
    double getWeight(){        
        int n =AnalysisCostManagementPlan.countBySubCategories(subCategories)
        int a = this.ranking
        double hasil 
        for(i in a..n){
            hasil+= 1/i
        }
        hasil = hasil/n
       return hasil
    } 
}