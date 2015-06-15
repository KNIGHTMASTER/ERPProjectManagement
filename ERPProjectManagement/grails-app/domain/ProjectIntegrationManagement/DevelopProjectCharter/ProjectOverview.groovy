package ProjectIntegrationManagement.DevelopProjectCharter

class ProjectOverview {

    String projectDescription
    String projectAssumptions
    String projectConstraints
    
    static belongsTo=
    [
        BusinessCase
    ]

    BusinessCase projectName

    static hasMany = 
    [
        goalsAndObjectives:GoalsAndObjectives
    ]
       
    
    String toString(){
        //return "project description :"+projectDescription+"\n\n\n"+"project assumptions :"+projectAssumptions+"\n\n\n"+"project constraints :"+projectConstraints;
		return "${projectName}"
    }
        
    static constraints = {
        projectName(unique:true)
        projectDescription(maxSize:2000)
        projectAssumptions(maxSize:2000)
        projectConstraints(maxSize:2000)        
        goalsAndObjectives()
    }
}
