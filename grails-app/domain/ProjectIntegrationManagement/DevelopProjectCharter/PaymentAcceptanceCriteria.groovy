package ProjectIntegrationManagement.DevelopProjectCharter

class PaymentAcceptanceCriteria {

    static belongsTo = 
    [
        projectName:ProjectCharter,
        payment:Payment
    ]
    
    String acceptanceCriteria
    String description
    
    static constraints = {
        projectName()
        payment()
        acceptanceCriteria()
        description(maxSize:1000)
    }
}
