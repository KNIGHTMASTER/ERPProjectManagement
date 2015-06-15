package ProjectScopeManagement.CreateWBS

class Element {
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        wbsName:Wbs
    ]
    
    String level
    String wbsCode
    String elementName
    
    String getLevel(){
        return level
    }
    
    String getWbsCode(){
        return wbsCode
    }
        
    String getElementName(){
        return elementName
    }

    String toString(){
        return elementName
    }
    
    static constraints = {
        projectName()
        wbsName()
        level(blank:false, inList:["1", "2", "3"])
        wbsCode(unique:true)
        elementName()
    }
}
