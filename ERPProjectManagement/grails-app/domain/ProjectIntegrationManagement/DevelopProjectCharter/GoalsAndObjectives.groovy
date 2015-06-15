package ProjectIntegrationManagement.DevelopProjectCharter

class GoalsAndObjectives {
    
    String goalsAndObjective
    
    static belongsTo=
    [
        ProjectOverview
    ]

    ProjectOverview projectName

    String toString(){
        return goalsAndObjective
    }
    
    static constraints = {
        projectName()
        goalsAndObjective(maxSize: 2000)
    }
}
