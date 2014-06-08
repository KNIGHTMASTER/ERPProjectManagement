package ProjectProcurementManagement.PlanProcurement

class RequirementProcurement {
    static belongsTo = [ 
        ProjectTimeManagement.DefineActivity.Activity,
        ProjectProcurementManagement.PlanProcurement.Material,
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
     ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectTimeManagement.DefineActivity.Activity activity
    ProjectProcurementManagement.PlanProcurement.Material materialName

    Date startDate
    Date endDate
    int amount
    BigDecimal priceReference
    String description
    
    static constraints = {
        projectName()
        activity()
        materialName(blank:false)
        startDate()
        endDate()
        amount()
        priceReference()
        description(nullable:true,maxSize:500)
    }
    String toString(){
        return "$materialName"
    }
    static mapping = {
    order  "asc"
    sort   "activity"
    }
    static printFields = ['activity','materialName','schedule','description']
}

    