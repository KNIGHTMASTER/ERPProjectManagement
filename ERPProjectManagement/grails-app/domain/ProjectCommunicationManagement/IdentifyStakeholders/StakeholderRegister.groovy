package ProjectCommunicationManagement.IdentifyStakeholders

import ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRoles

class StakeholderRegister {

    static belongsTo = [
            ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork,
            StakeholderRoles
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork projectName
    StakeholderRoles role
    CommunicationType communicationType

    String fullName
    String designation
    String department
    String stakeholderType
    String expectations
    String influenceOnProjectOutcome
    String email
    String phone
    byte[] image

    Date dateCreated

    static mapping = {
        autoTimestamp(true)
        sort 'fullName'
        order 'asc'
    }


    String toString(){
        return "${fullName}"
    }
    static constraints = {
        projectName(blank:false)
        role(blank:false)
        fullName(blank:false)
        designation()
        department()
        role()
        stakeholderType(inList : ["External", "Internal"])
        communicationType()
        expectations(maxSize: 2000)
        influenceOnProjectOutcome(maxSize:2000)
        email(email: true, blank:false)
        phone()
        image(nullable:true, maxSize: 1000000)
    }
	
}       