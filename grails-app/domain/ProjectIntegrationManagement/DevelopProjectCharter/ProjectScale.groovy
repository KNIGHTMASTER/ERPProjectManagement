package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectScale {      
    BigDecimal minPrice
    BigDecimal maxPrice
    String description
    
    /*static hasMany = 
    [
        projectProposal:ProjectProposal
    ]*/
    
    String scale
    
    String toString(){
        return scale
    }
    
    static transients = ['Scale']
    
    String getScale(){        
        if(minPrice<75000000){
            return "Low"
        }else if(minPrice>=75000000 && maxPrice<=150000000){
            return "Moderate"
        }else if(minPrice>150000000 && maxPrice<=300000000){
            return "High"
        }else if(maxPrice>300000000){
            return "Enterprise"
        }else{
            return "Other"
        }
    }
    
    
    static constraints = {
        scale(nullable:true)
        minPrice()        
        maxPrice()
        description(maxSize:2000)
    }
}
