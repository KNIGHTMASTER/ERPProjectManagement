package ProjectCostManagement.DetermineBudget

class CostManagementPlan {
    static hasMany = 
        [
            approval : ProjectCostManagement.CostApproval
        ]
    static belongsTo = 
        [
                ProjectIntegrationManagement.DevelopProjectCharter.Milestones,
                ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
        ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    ProjectIntegrationManagement.DevelopProjectCharter.Milestones milestone

    BigDecimal plannedValue // anggaran resmi yang direncanakan untuk aktivitas yang dijadwalkan
         
    static constraints = {
        projectName()
        milestone()
        plannedValue(blank:false)
        approval(blank:false)        
    }
    String toString(){
        return "milestone $milestone = $plannedValue"
    }
}
