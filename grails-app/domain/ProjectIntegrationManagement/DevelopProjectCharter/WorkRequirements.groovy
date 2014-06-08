package ProjectIntegrationManagement.DevelopProjectCharter

class WorkRequirements {
    
    static belongsTo=
    [
        StatementOfWork
    ]

    StatementOfWork projectName

    /*static hasMany = 
    [
        workPackages:WorkPackage
    ]*/
    
    String workPackage
    Date start
    Date finish

    String toString(){
        return "${workPackage}: start ${start} - finish ${finish}"
    }

    def static reportable = [:]
    /*def static reportable = [
        title: 'workRequirements',
        fileName: 'workRequirements',
        columns: ['workPackage']
    ]*/
    
    static constraints = {
        projectName()
        workPackage()
        start()
        finish()
    }
}
