package ProjectIntegrationManagement.DirectAndManageProjectExecution

import ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
import ProjectTimeManagement.DefineActivity.ActivityTracking
import ProjectTimeManagement.DefineActivity.Activity
class StatusController {

    def index() {         
        ambilData();
        createChart();                
    }
    
    String completeData="";
    String taskData="";
    def complete2
    def ambilData(){
        def data
        if(session.proyek){
            def project = StatementOfWork.get(session.proyek)
            def milestones = project.milestones
            milestones.each{
                def activities = Activity.findAllByIdMilestone(it.idMilestone)
                activities.each{
                    def trackings = ActivityTracking.findAllByActivity(it.id)
                    trackings.each {
                        
                    }
                }
            }
        }
        def activity = ProjectTimeManagement.DefineActivity.Activity.executeQuery("select t from ActivityTracking t")
        activity.each{
        def complete = it.complete;
        def task= it.doWork;
        completeData+=complete+","        
        taskData+="'"+task+"',";                        
        }
        //complete2=completeData.split[","];
    }
    
    def createChart(){
     def js="""
    <script type="text/javascript" >        
        // Build the chart        
        var colors = Highcharts.getOptions().colors;
        var chart;
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'bar',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: 'Project Status',
                x: -20 //center
            },
            subtitle: {
                text: 'Implementasi Rollout SAP',
                x: -20
            },
            xAxis: {
                categories: ["""+taskData+"""]
            },
            yAxis: {
                title: {
                    text: 'Project Status All Milestones'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#0000CC'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y ;
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [{
                name: 'Status',
                data: ["""+completeData+"""],
                color:['#FF0000']
            }]
        });
        var data
        
    </script>  
    """        
    [data:js]
    }
}
