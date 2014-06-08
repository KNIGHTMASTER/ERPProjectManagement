package ProjectIntegrationManagement.DevelopProjectCharter

class PlaceOfPerformance {
    
    String location
    String description
    static belongsTo = 
    [
        StatementOfWork
    ]

    StatementOfWork projectName

    String toString(){
        return location
    }
    static constraints = {
        projectName()
        location()
        description(maxSize:1000)        
    }
}
