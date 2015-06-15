package ProjectCommunicationManagement.IdentifyStakeholders

class CommunicationType {

    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork statementOfWork
    String communicationType
    String description

    String toString(){
        return "$communicationType"
    }
    static constraints = {
        statementOfWork()
        communicationType(blank:false)
        description(maxSize: 1000)
    }
}
