package ProjectIntegrationManagement.DevelopProjectCharter

class ProblemDefinition {
    String problemStatement
    String organizationalImpact
    String technologyMigration
    
    static belongsTo=
    [
        BusinessCase
    ]

    BusinessCase projectName
    String toString(){
        return "problem statement :"+problemStatement+"\n\n\n"+"organizational impact :"+organizationalImpact+"\n\n\n"+"technology migration :"+technologyMigration;
    }
    static constraints = {
        projectName(unique:true)
        problemStatement(maxSize:2000)
        organizationalImpact(maxSize:2000)
        technologyMigration(maxSize:2000)
    }
}
