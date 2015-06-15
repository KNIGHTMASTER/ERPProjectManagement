package ProjectProcurementManagement.AdministerProcurements

class Contract {

    static belongsTo = [
        ProjectProcurementManagement.ConductProcurements.VendorRegister,
        ProjectProcurementManagement.PlanProcurement.Approval,
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectProcurementManagement.ConductProcurements.VendorRegister vendorName
    ProjectProcurementManagement.PlanProcurement.Approval materialName

    String noContract
    BigDecimal price
    Date    contractDate
    Date    startWork
    Date    endWork
    Boolean acceptance
    Boolean complete
 
    static constraints = {
        projectName()
        vendorName(blank:false)
        noContract()
        materialName(blank:false)
        price()
        contractDate()
        startWork()
        endWork()
        acceptance()
        complete()
    }
        String  toString(){
            "$vendorName: $materialName :$noContract"
        }
    static mapping = {
    order  "asc"
    sort   "endWork"
    }
}