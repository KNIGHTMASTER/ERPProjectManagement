package ProjectQualityManagement

class QualityManagementPlan {
    static belongsTo=
    [
        projectCharter:ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]
    Date dateCreated    
    String qualityAssuranceApproach
    static constraints = {
        projectCharter()                
        qualityAssuranceApproach(blank:false,maxSize:500)
        dateCreated()
    }
    String toString(){
        return "$projectCharter, QualityRange: QualityManagementPlan: $id"
    }
}
