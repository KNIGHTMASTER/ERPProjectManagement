package ProjectProcurementManagement.ConductProcurements

class ProcurementHistory {
    static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    String vendorName
    String productQuality
    String onTimeDelivery
    String documentationQuality
    String developmentCost
    String developmentTime
    String costPerUnit
    String transactionalEfficiency
    String quality
   
    static constraints = {
        projectName()
        vendorName()
        productQuality(nullable:true,inList:["TM","M","SM"])
        onTimeDelivery(nullable:true,inList:["TM","M","SM"])
        documentationQuality(nullable:true,inList:["TM","M","SM"])
        developmentCost(nullable:true,inList:["TM","M","SM"])
        developmentTime(nullable:true,inList:["TM","M","SM"])
        costPerUnit(nullable:true,inList:["TM","M","SM"])
        transactionalEfficiency(nullable:true,inList:["TM","M","SM"])
        quality(nullable:true,inList:["TM","M","SM"])
    }
}
