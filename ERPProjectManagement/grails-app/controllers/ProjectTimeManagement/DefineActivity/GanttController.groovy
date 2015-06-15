package ProjectTimeManagement.DefineActivity
import ProjectIntegrationManagement.DevelopProjectCharter.*;

class GanttController {

    def index() {
        [data:createGanttChart()]
    }

    def createGanttChart(){
        def js = """

    <script>
        var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'day');

	g.setShowRes(1);
	g.setShowDur(1);
	g.setShowComp(1);
        g.setCaptionType('Resource');


  //var gr = new Graphics();

  if( g ) {

    // Parameters             (pID, pName,                  pStart,      pEnd,     pColor,   pLink,   pMile, pRes,                            pComp, pGroup, pParent, pOpen,                pDepend, pCaption)

"""
        def project
        if(session.proyek){
            project = ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.get(session.proyek)
        }else{
            project = ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()
        }
        project.each{
            def idProject = it.idProject;
            def projectName = it.projectName;
            js+= "g.AddTaskItem(new JSGantt.TaskItem(${idProject},  '${projectName}', '', '', '', '', '', '', 0, 1, 0, 0));"

            def milestones = ProjectIntegrationManagement.DevelopProjectCharter.Milestones.executeQuery("select t from Milestones t where idProject=${it.id}")

            milestones.each{
                def idMilestone = it.idMilestone;
                def milestoneName = it.milestoneName;
                def parent = it.parent;
                def start = it.startDate.format('dd/MM/yyyy').toString();
                def end = it.endDate.format('dd/MM/yyyy').toString();
                js+= "g.AddTaskItem(new JSGantt.TaskItem(${idMilestone},  '${milestoneName}', '${it.startDate}',  '${it.endDate}', '', '', '', '', 0, 1, ${parent}, 0));"


                def activity = ProjectTimeManagement.DefineActivity.Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activity.each{

                    js+="g.setDateInputFormat('dd/mm/yyyy');"
                    js+="g.setDateDisplayFormat('dd/mm/yyyy');"
                    def startDate = it.startDate.format('dd/MM/yyyy').toString();
                    def endDate = it.endDate.format('dd/MM/yyyy').toString();
                    def complete = it.complete;
                    //     def predecessor = it.predecessors.idTask;
                    def pColor;
                    if (complete==100)
                        pColor = "#00ff00" // ijo terlaksana good
                    else if(complete<100 && complete>50)
                        pColor = "#FF0000" //merah gagal telah melebihi jadwal
                    else if(complete<=50 && complete>0)
                        pColor = "#ff6666" // orange hati hati dalam proses pelaksanaan
                    else if(complete==0)
                        pColor = "#0000CC" // orange hati hati dalam proses pelaksanaan
                    def task = "${idMilestone}"+"${it.idTask}"
                    js+="g.AddTaskItem(new JSGantt.TaskItem(${task}, '${it.taskName}',       '${startDate}',  '${endDate}', '${pColor}', 'http://help.com', 0, '${it.resources}',             ${it.complete}, 0, ${idMilestone}, 1));"
                }
            }
        }

        js+= """
    g.Draw();
    g.DrawDependencies();

  }

  else

  {

    alert("not defined");

  }

</script>


<TABLE width="100%" cellpadding="0" cellspacing="0" style="position:absolute; top:100; left:100;">
  <TBODY><TR>

    <TD bgcolor="#C0C0C0" style="height:3px;"></TD></TR>


  <TR>

  </TR>

  </TBODY>

</TABLE>
"""
        return js
    }
}
