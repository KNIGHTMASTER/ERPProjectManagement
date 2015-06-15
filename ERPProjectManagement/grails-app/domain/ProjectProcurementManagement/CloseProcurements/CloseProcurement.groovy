package ProjectProcurementManagement.CloseProcurements

class CloseProcurement {

  static belongsTo = [
        ProjectProcurementManagement.PlanProcurement.Approval,
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

   ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
   ProjectProcurementManagement.PlanProcurement.Approval materialName

   Date date
   Boolean complete
   String comment
    
    static constraints = {
        projectName()
        materialName(blank:false)
        date()
        complete()
        comment(nullable:true,maxSize:500)
       }
    String toString(){
        return"$materialName: $complete"
    }
    static mapping = {
    order  "asc"
    sort   "materialName"
    }
}
