package ProjectProcurementManagement.PlanProcurement

class Material {

   static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectProcurementManagement.ConductProcurements.MaterialCriteria
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectProcurementManagement.ConductProcurements.MaterialCriteria materialName

    String justification
    
   static constraints = {
        projectName()
        materialName()
        justification(nullable:true,maxSize:500)
    }
    String toString(){
            return "$materialName"
        }
    static mapping = {
    order  "asc"
    sort   "materialName"
    }
}

