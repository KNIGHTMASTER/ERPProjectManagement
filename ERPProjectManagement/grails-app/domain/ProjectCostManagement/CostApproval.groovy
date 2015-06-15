package ProjectCostManagement

class CostApproval {
    static belongsTo = 
        [
            stakeholder:ProjectHumanResourceManagement.Employee,
            costManagementPlan:ProjectCostManagement.DetermineBudget.CostManagementPlan
        ]
    Date dateCreate
    Boolean accepted
    String comment
    
    String toString(){
        return "$accepted"
    }
    
    static constraints = {
        costManagementPlan()
        dateCreate()
        accepted()
        stakeholder()
        comment(nullable:true, maxSize:500)
    }
}