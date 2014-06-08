package ProjectIntegrationManagement.MonitoringAndControllingProjectWork

class Perspektif {

    static belongsTo = [
            ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    String data1
    String data2
    double value
    static constraints = {
        projectName()
        data1(inList:['Finance', 'Customer', 'Internal Process', 'Learning and Growth'])
        data2(inList:['Finance', 'Customer', 'Internal Process', 'Learning and Growth'])
        value()
    }
}
