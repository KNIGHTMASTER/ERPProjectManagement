package ProjectIntegrationManagement.DevelopProjectManagementPlan

class ChangeControlBoard {
    
    static belongsTo = 
    [
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister,
        ChangeManagementPlan
    ]

    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder
    ChangeManagementPlan projectName

    String role, responsibility, authority
    
    String toString(){
        return "${stakeholder}:${projectName}"
    }
    
    static constraints = {
        projectName()
        stakeholder()
        role()
        responsibility()
        authority()
    }
}
