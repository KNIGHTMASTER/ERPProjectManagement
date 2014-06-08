package ProjectProcurementManagement.ConductProcurements

class ProcurementNegotiation {
   
   
   static belongsTo = [
        ProjectProcurementManagement.AdministerProcurements.PerformanceVendor,
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

   ProjectProcurementManagement.AdministerProcurements.PerformanceVendor vendorName
   ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

   String policy
   Boolean lock
   Boolean unLock
    
   static constraints = {
        projectName()
        vendorName(blank:false)
        policy()
        lock()
        unLock()
    }
    String toString(){
        return "$vendorName:$lock:$unLock"
    }
}
