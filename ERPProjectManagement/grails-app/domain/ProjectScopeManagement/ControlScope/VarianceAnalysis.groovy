package ProjectScopeManagement.ControlScope

import ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeBoardApproval

class VarianceAnalysis {
    
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
    Date dateRequested
    static constraints = {
        projectName()
        dateRequested()
        changeRequestor(blank:false)
        changeCategory(blank:false, inList:["Scope"])
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
