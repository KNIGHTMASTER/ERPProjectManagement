package ProjectIntegrationManagement.DevelopProjectCharter

class FeasibilityStudy {
    String executiveSummary
    String descriptionOfProducts
    String technologyConsiderations
    String productMarketPlace
    String marketingStrategy
    String organizationAndStaffing
    String schedule
    String financialProjections
    String recommendations
        
    static belongsTo = 
    [
        projectName:ProjectProposal
    ]

    String toString(){
        return projectName;
    }
    
    static constraints = {
        projectName(unique:true)
        executiveSummary(maxSize:200000)
        descriptionOfProducts(maxSize:200000)
        technologyConsiderations(maxSize:2000000)
        productMarketPlace(maxSize:200000)
        marketingStrategy(maxSize:200000)
        organizationAndStaffing(maxSize:200000)
        schedule(maxSize:200000)
        financialProjections(maxSize:200000)
        recommendations(maxSize:200000)
    }
}
