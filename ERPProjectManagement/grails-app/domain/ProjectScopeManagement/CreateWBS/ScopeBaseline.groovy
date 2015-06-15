package ProjectScopeManagement.CreateWBS

class ScopeBaseline {

    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        projectScopeStatement:ProjectScopeManagement.DefineScope.ProjectScopeStatement,
        wbs:Wbs,
        wbsDictionary:WbsDictionary        
    ]
    
    String toString(){
        return projectName
    }
    
    static constraints = {
        projectName()
        projectScopeStatement()
        wbs()
        wbsDictionary()
    }
}
