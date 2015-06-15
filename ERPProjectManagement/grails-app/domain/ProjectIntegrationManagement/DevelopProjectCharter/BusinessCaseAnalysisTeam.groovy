package ProjectIntegrationManagement.DevelopProjectCharter

class BusinessCaseAnalysisTeam {
    String role
    String description
    
    static belongsTo=
    [
        BusinessCase,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister name
    BusinessCase projectName

    String toString(){
        return role+" : "+description+" : "+name
    }
    
    static constraints = {
        projectName()
        name()
        role()
        description()
    }
}
