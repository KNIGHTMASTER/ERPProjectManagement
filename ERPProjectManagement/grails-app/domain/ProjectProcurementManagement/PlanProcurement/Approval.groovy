package ProjectProcurementManagement.PlanProcurement

class Approval {

     static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister,
        ProjectProcurementManagement.PlanProcurement.RequirementProcurement
    ]
     static hasMany = [
            bidderSelected:ProjectProcurementManagement.ConductProcurements.BidderSelected,
            materialName:ProjectProcurementManagement.AdministerProcurements.Contract
        ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholderRegister
    ProjectProcurementManagement.PlanProcurement.RequirementProcurement materialName

    Boolean accepted
    String comment
    Date dateApproval
    
    static constraints = {
        projectName()
        dateApproval()
        materialName(blank:true)
        stakeholderRegister()
        accepted()
        comment(maxSize:500,nullable:true)
    }

    String toString(){
        return"$materialName"
    }
}
