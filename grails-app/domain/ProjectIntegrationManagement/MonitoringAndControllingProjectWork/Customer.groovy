package ProjectIntegrationManagement.MonitoringAndControllingProjectWork

class Customer {
    static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]
    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister stakeholder

    int nComplain

    static constraints = {
    }
}
