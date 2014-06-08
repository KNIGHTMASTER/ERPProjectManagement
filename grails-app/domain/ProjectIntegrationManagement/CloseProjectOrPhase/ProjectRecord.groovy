package ProjectIntegrationManagement.CloseProjectOrPhase

import ProjectCostManagement.DetermineBudget.ActivityCost
import ProjectCostManagement.DetermineBudget.ManagementCostActivity
import ProjectCostManagement.DetermineBudget.MaterialCostActivity
import ProjectCostManagement.DetermineBudget.MonthBudget
import ProjectIntegrationManagement.DevelopProjectCharter.GoalsAndObjectives
import ProjectIntegrationManagement.DevelopProjectCharter.Milestones
import ProjectScopeManagement.VerifyScope.Inspection

class ProjectRecord {
Date dateCreated
    static mapping = {
        autoTimestamp true
    }    
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectCostManagement.DetermineBudget.Budget
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    ProjectCostManagement.DetermineBudget.Budget projectBudget


    static hasMany = [
        projectDeliverables:Inspection,
        goalsAndObjectives:GoalsAndObjectives,
        projectTeam:ProjectIntegrationManagement.DirectAndManageProjectExecution.ManageTeamMemberAssignedToProject,
        //START COST PERFORMANCE
        activityCosts:ActivityCost,
        materialActivityCosts:MaterialCostActivity,
        managementCostActivity:ManagementCostActivity,
        monthBudgets:MonthBudget,
        //END OF COST PERFORMANCE
        projectSchedule:Milestones,
        approvals:RecordAcceptance
    ]
    
    String projectSummary
    String transitionToOperation
    String qualityManagement
    String communicationManagement
    String lessonLearned
    String recommendations        


    static constraints = {
        projectName()
        projectSummary(maxSize:200000)
        projectTeam()
        transitionToOperation(maxSize:2000)
        goalsAndObjectives()
        projectDeliverables()
        projectSchedule()
        projectBudget()
        monthBudgets()
        activityCosts()
        materialActivityCosts()
        managementCostActivity()
        qualityManagement(maxSize:20000)
        communicationManagement(maxSize:200000)
        lessonLearned(maxSize: 20000)
        recommendations(maxSize:20000)
        approvals()
    }
}
