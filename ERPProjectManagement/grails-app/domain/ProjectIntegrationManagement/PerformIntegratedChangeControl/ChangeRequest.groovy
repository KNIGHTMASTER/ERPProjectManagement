package ProjectIntegrationManagement.PerformIntegratedChangeControl

import ProjectScopeManagement.ControlScope.VarianceAnalysis

class ChangeRequest {

    static mapping = {
        autoTimestamp true
    }
    
    static belongsTo = 
    [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister changeRequestor
    
    String toString(){
        return "${changeRequestor} : ${changeCategory}"
    }

    static hasMany = [
        approvals:ChangeBoardApproval
    ]

    Date dateRequested
    String changeCategory
    String changeAffect
    String changeRequested
    String reasonForChange
    String alternativeConsidered
    String requiredTechnicalChange
    String riskForTheChange
    int estimatedCostNeeded
    String estimatedResourceNeeded
    String implicationOfQuality
 
    static constraints = {
        projectName()
        dateRequested()
        changeRequestor(blank:false)
        changeCategory(blank:false, inList:["Time", "Cost", "Scope", "QualityRange", "Risk", "Human Resource", "Procurement", "Communication"])
        changeAffect(blank:false, inList:["Corrective Action", "Preventive Action", "Defect Repair", "Updates", "Other"])
        changeRequested(maxSize:1000)
        reasonForChange(maxSize:1000)
        alternativeConsidered(maxSize:1000)
        requiredTechnicalChange(maxSize:1000)
        riskForTheChange(maxSize:1000)
        estimatedCostNeeded()
        estimatedResourceNeeded(maxSize:1000)
        implicationOfQuality(maxSize:1000)
        approvals()
    }
}
