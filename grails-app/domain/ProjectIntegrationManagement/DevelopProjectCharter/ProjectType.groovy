package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectType {
    String projectType
    String description
    
    String toString(){
        return "$projectType"
    }
    static constraints = {
        projectType(uniqe:true, blank:false)
        description(maxSize:5000)
    }
}
