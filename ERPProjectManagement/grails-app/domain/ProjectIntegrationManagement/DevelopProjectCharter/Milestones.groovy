package ProjectIntegrationManagement.DevelopProjectCharter

import ProjectCostManagement.DetermineBudget.CostManagementPlan

class Milestones {
    
    static hasMany =
        [
            //developProjectManagementPlan:ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan,
            activity:ProjectTimeManagement.DefineActivity.Activity,
            costManagementPlans:CostManagementPlan
        ]
    
    static belongsTo=
    [
        StatementOfWork
    ]

    StatementOfWork idProject

    String toString(){
        return idMilestone
        //return "${idProject} - ${idMilestone}: ${milestoneName}"
    }
    
    
    int idMilestone
    String milestoneName
    int parent
    Date startDate
    Date endDate
    String description
    
    int getIdMilestone(){
        return idMilestone;
    }
    
    static constraints = {
        //projectName()
        idMilestone()
        //milestoneType()
        milestoneName()        
        parent()
        startDate()
        endDate()
        description(maxSize:2000)
    }
    static mapping = {
        order  "asc"
        sort   "idMilestone"
    }
}
