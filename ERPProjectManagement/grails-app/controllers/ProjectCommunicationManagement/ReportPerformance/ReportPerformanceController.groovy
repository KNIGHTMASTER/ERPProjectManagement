package ProjectCommunicationManagement.ReportPerformance

import ProjectCostManagement.ControlCost.ForecastingChartController
import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectIntegrationManagement.MonitoringAndControllingProjectWork.BalancedScoreCardController
import ProjectIntegrationManagement.MonitoringAndControllingProjectWork.KPIBarChartController
import ProjectTimeManagement.DefineActivity.DiagramActivityController
import ProjectTimeManagement.DefineActivity.GanttController
import grails.plugins.springsecurity.Secured

class ReportPerformanceController {

    @Secured(['ROLE_ADMIN', 'ROLE_PCOM'])
    def index() {
        def namaProyek
        if(session.proyek){
            namaProyek = StatementOfWork.get(session.proyek)
            namaProyek = namaProyek.projectName

            def ganttObj = new GanttController()
            def bsc = new BalancedScoreCardController()
            def kpi = new KPIBarChartController()
            def forecasting = new ForecastingChartController()
            //def diagramActivity = new DiagramActivityController()

            [namaProyek:namaProyek, gantt: ganttObj.createGanttChart(), dataBSC:bsc.createChartPie(), data2:kpi.createChartBar(), forecasting: forecasting.createChartForecasting() /*diagramActivity:diagramActivity.createDiagramActivity()*/]
        }else{
            namaProyek = ""
            redirect uri: '/chooseProject?tautan=ReportPerformance'
        }
    }

}
