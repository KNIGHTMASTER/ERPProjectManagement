package ProjectIntegrationManagement.DevelopProjectCharter

class ReviewProjectProposal {
    
    Boolean acceptance;
    String projectStatus;
    String description;
    
    static belongsTo = 
    [
        ProjectProposal,
        ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister
    ]

    ProjectProposal projectName
    ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister reviewer

    Boolean getAcceptance(){
        /*def hasil = ProjectAcceptance.executeQuery("select acceptance from ProjectAcceptance where id="+this.id);
        hasil.each{
            acceptance = hasil.get(0);
        } */
        def hasil = ProjectAcceptance.where{id == projectName}
        return hasil.acceptance
    }
    
    String getProjectStatus(){
        switch(acceptance){
            case true:projectStatus="GRANTED";break;
            case false:projectStatus="REJECTED";break;
            default:projectStatus="Undefined";
        }
    }
    
    String toString(){
        return projectName;
    }
    
    static constraints = {
        projectName()
        reviewer(nullable:true)
        projectStatus(nullable:true, disable:true)
        description(maxSize:200000)
        acceptance(nullable:true, disable:true)
    }
}
