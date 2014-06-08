package ProjectScopeManagement.CollectRequirements

class RequirementsDocumentation {
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
        
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder

        String requirement
        String category
        String priority
        String acceptanceCriteria
        
    /*static hasMany =
    [
        createProjectScopeStatement:ProjectScopeManagement.DefineScope.CreateProjectScopeStatement,
        createWBS:ProjectScopeManagement.CreateWBS.CreateWBS,
        verifyScope:ProjectScopeManagement.VerifyScope.VerifyScope
    ]*/
            
    String toString(){
        return "$requirement";
    }
    
    static constraints = {
        projectName()
        stakeholder()
        requirement(maxSize:1000)
        category(maxSize:1000)
        priority(maxSize:1000)
        acceptanceCriteria(maxSize:1000)
    }
}