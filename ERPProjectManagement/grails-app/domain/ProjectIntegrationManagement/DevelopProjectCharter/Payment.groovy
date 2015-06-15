package ProjectIntegrationManagement.DevelopProjectCharter

class Payment {
    
    static belongsTo = 
    [
        ProjectCharter
    ]

    ProjectCharter projectName

    static hasMany = [
        paymentAcceptanceCriteria:PaymentAcceptanceCriteria
    ]
    
    String toString(){
        return "${projectName} - ${paymentMethod}: IDR ${cost}"
    }
    String paymentMethod
    BigDecimal cost
    
    static constraints = {
        projectName();
        paymentMethod();
        paymentAcceptanceCriteria();
        cost();
    }
}
