package ProjectProcurementManagement.ConductProcurements

class VendorRegister {
    static belongsTo = [
            ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
            ProjectProcurementManagement.AdministerProcurements.PerformanceVendor
        ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectProcurementManagement.AdministerProcurements.PerformanceVendor vendorName
    Date dateRegister
    String companyType
    
    static constraints = {
        projectName()
        vendorName(blank:false)
        companyType(nullable:true,inList:["Big Enterprise","Middle Enterprise","Community Development"])
        dateRegister(nullable:true)
    }
    String toString(){
        return "$vendorName"
    }
}
