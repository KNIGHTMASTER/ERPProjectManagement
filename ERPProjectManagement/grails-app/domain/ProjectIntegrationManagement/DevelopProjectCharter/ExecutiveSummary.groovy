package ProjectIntegrationManagement.DevelopProjectCharter

class ExecutiveSummary {

    String issue
    String anticipatedOutcomes
    String recommendation
    String justification    
    
    static belongsTo=
    [        
        BusinessCase
    ]

    BusinessCase projectName

    String toString(){
        return "issue :"+issue+"\n\n\n"+"anticipated outcomes :"+anticipatedOutcomes+"\n\n\n"+"recommendation :"+recommendation+"\n\n\n\n\n\n\n\n\n"+"justification :"+justification;
    }
    
    static constraints = {
        projectName(unique:true)
        issue(maxSize:2000)
        anticipatedOutcomes(maxSize:2000)
        recommendation(maxSize:2000)
        justification(maxSize:2000)
    }
}
