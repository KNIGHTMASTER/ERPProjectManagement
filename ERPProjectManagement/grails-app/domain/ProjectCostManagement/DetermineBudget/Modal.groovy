package ProjectCostManagement.DetermineBudget

class Modal {
    static belongsTo = 
    [
        projectName : ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    String source
    Date datePayment
    BigDecimal value
    String description
    static constraints = {
        projectName()
        value(blank:false)
        source()
        datePayment()        
        description(maxsize:2000)
    }
}
