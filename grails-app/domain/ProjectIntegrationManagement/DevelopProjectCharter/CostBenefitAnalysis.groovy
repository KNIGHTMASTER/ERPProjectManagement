package ProjectIntegrationManagement.DevelopProjectCharter

class CostBenefitAnalysis {
    
    String actionAnalysis
    String actionType
    String description
    BigDecimal firstYearCost    
    BigDecimal netFirstYearSavings
    Integer proyekid
    
    static belongsTo=
    [
        projectName:BusinessCase
    ]   
    
    BigDecimal getFirstYearCost(){
        if(actionType.equals("Cost")){
            firstYearCost = firstYearCost
        }else if((actionType.equals("Savings")) && (firstYearCost>=0)){
            firstYearCost = - firstYearCost
        }else if((actionType.equals("Savings")) && (firstYearCost>=0)){
            firstYearCost = firstYearCost
        }

        return firstYearCost
    }    

    static transients = ['netFirstYearSavings']
    
    BigDecimal getNetFirstYearSavings(){
        def fyc = CostBenefitAnalysis.executeQuery('select firstYearCost from CostBenefitAnalysis')
        def a=0
        fyc.each{
            netFirstYearSavings += fyc.get(a)
            a++
        }              
        return netFirstYearSavings
    }    
    
    String toString(){
        return "Action ${actionType} : IDR ${firstYearCost}"
    }

    static constraints = {
        projectName()
        actionAnalysis(maxSize:1000)
        actionType(blank:false, inList:["Cost", "Savings"])
        description(maxSize:2000)
        firstYearCost()
        proyekid(nullable:true)
    }
}
