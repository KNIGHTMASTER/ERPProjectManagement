package ProjectScopeManagement.CreateWBS

class WbsDictionary {
    Date dateCreated
    
    static mapping = {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        projectName:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        wbsName:Wbs
    ]    
    
    Element element= new Element();
    
    String level
    String wbsCode
    String elementName
    
    String getLevel(){
        return element.getLevel()
    }
    
    String getWbsCode(){
        return element.getWbsCode()
    }
    
    String getElementName(){
        return element.getElementName()
    }
    static transients = 
    [
        "level", "wbsCode", "elementName"
    ]    
            
    String toString(){
        return projectName
    }
    
    String definition
    
    static constraints = {
        projectName()
        wbsName()
        element()
        level()
        wbsCode()
        elementName()
        definition(maxSize:1000)
    }
}
