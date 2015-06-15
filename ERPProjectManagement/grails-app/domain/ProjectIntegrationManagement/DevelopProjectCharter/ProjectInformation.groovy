package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectInformation {

    String projectStatus
    
    Boolean acceptance
    
    static belongsTo = 
    [
        ProjectProposal
    ]

    ProjectProposal projectName
    /*Boolean getAcceptance(){
        def hasil = ProjectAcceptance.executeQuery("select acceptance from ProjectAcceptance where id="+this.id);
        hasil.each{
            this.acceptance = hasil.get(0);
        }        
    }
   
    String getAcceptedProject(){
        //return namaProyek?:ProjectInformation.findByProjectStatus("Accepted")
        return ProjectInformation.findAllByProjectStatus("Accepted")
    }
    
    String getProjectStatus(){
        switch(acceptance){
            case true:projectStatus="Accepted";break;
            case false:projectStatus="Rejected";break;
            default:projectStatus="Undefined";
        }
    }*/
    
    String toString(){
        return projectName?:ProjectInformation.findAllByProjectStatus("Accepted")
    }
    
    static constraints = {
        projectName(unique:true)
        projectStatus()
    }
}
