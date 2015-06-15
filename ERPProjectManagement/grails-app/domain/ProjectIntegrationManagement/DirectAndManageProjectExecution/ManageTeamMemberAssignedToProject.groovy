package ProjectIntegrationManagement.DirectAndManageProjectExecution

class ManageTeamMemberAssignedToProject {
        
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectHumanResourceManagement.Employee,
        ProjectTimeManagement.DefineActivity.Activity
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectHumanResourceManagement.Employee leader
    ProjectTimeManagement.DefineActivity.Activity activity

    static hasMany = [
            teamMembers:ProjectHumanResourceManagement.Employee
    ]

    Boolean assigned

    String description

    String toString(){
        return "${leader} as leader for ${activity} : ${assigned}"
    }

    static constraints = {
        projectName()
        activity()
        leader()
        teamMembers()
        assigned()
        description(maxSize:2000)
    }
}
