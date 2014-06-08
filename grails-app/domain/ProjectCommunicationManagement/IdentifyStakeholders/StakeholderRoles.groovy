package ProjectCommunicationManagement.IdentifyStakeholders

class StakeholderRoles {

    static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork projectName

    String role
    String description

    String toString(){
        return "${role}"
    }
    static constraints = {
        projectName()
        role(blank:false)
        description(maxSize: 2000)
    }
}
