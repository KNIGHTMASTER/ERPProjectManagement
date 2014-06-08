package ProjectTimeManagement.DefineActivity
import ProjectIntegrationManagement.DevelopProjectCharter.*;

class DiagramActivityController {
                        //dataID, rootID, lable
    def index() {
        [data:createDiagramActivity()]
    }

    def createDiagramActivity(){
        def tr = """
function CreateTree() {
                t = new ECOTree('t','sample1');

                """
        tr+="t.add(0,-1,'WBS',null,null,'yellow','black',null);"
        def project
        if(session.proyek){
            project = ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.get(session.proyek)
        }else{
            project = ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()
        }
        project.each{
            def idProject = it.idProject;
            def projectName = it.projectName;
            tr+="t.add('${it.idProject}',0,'$projectName',null,null,'red','black',null);"

            def milestone = ProjectIntegrationManagement.DevelopProjectCharter.Milestones.executeQuery("select t from Milestones t where idProject=${it.id}")
            milestone.each{
                def idMilestone = it.idMilestone
                def parent = it.parent;
                def milestoneName = it.milestoneName;
                tr+="t.add('${it.idMilestone}','${it.parent}','${milestoneName}',null,null,'green','black');"

                def activity = ProjectTimeManagement.DefineActivity.Activity.executeQuery("select t from Activity t where idMilestone=${it.id}")
                activity.each{
                    def idTask = it.idTask.toString();
                    def taskName = it.taskName;
                    tr+="t.add('${idTask}','${it.idMilestone}','${taskName}');"
                }
            }
        }

        tr+="""
				t.UpdateTree();
			}
        """
        return tr
    }
}
