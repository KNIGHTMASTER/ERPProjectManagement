package ProjectIntegrationManagement.DevelopProjectCharter

class BusinessCase {
    
    static belongsTo = 
    [
        ProjectProposal
    ]

    ProjectProposal projectName

    static hasMany=
    [
        problemDefinitions:ProblemDefinition, 
        //executiveSummaries:ExecutiveSummary,
        projectOverviews:ProjectOverview, 
        businessCaseAnalysisTeams:BusinessCaseAnalysisTeam, 
        businessCaseApprovals:BusinessCaseApproval,
        costBenefitAnalysis:CostBenefitAnalysis
    ]
    
    String toString(){
        return "$projectName"
    }
    static constraints = {
        projectName()
        //executiveSummaries()
        businessCaseAnalysisTeams()
        problemDefinitions()
        projectOverviews()
        costBenefitAnalysis() 
        businessCaseApprovals()
    }
}
