package ProjectRiskManagement.Planning

class AnalysisProjectScopeStatement {
    Date dateCreated
    static belongsTo=
    [
        identificationProjectScopeStatement:IdentificationProjectScopeStatement,
        subCategories:SubCategories
    ]    
    int ranking
    String description    
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
    double getWeight(){        
        int n =AnalysisProjectScopeStatement.countBySubCategories(subCategories)
        int a = this.ranking
        double hasil 
        for(i in a..n){
            hasil+= 1/i
        }
        hasil = hasil/n
       return hasil
    }
    static transients=['weight','total','category','subKategori']
    
    static constraints = {
        identificationProjectScopeStatement(nullable:true)
        ranking(blank:false)
        subCategories(nullable:true)
        description(blank:false,maxSize:500)
        dateCreated()
    }
    String toString(){
        return "$identificationProjectScopeStatement"
    }
     
}