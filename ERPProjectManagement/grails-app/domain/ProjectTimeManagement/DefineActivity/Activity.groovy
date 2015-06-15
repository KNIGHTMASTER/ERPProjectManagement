package ProjectTimeManagement.DefineActivity

import ProjectCostManagement.DetermineBudget.MaterialCostActivity

class Activity {
  static hasMany = [
    predecessors:ProjectTimeManagement.DefineActivity.Activity,
    successors:ProjectTimeManagement.DefineActivity.Activity,
    resources:ProjectHumanResourceManagement.TeamDevelopment,
    timeApproval:ProjectTimeManagement.DevelopSchedule.TimeApproval,
    trackings: ProjectTimeManagement.DefineActivity.ActivityTracking,
    materials: ProjectProcurementManagement.PlanProcurement.RequirementProcurement
  ]
  static belongsTo = [
    Task,
    ProjectIntegrationManagement.DevelopProjectCharter.Milestones
  ]

    Task taskName
    ProjectIntegrationManagement.DevelopProjectCharter.Milestones idMilestone
  static mapping = {
    order  "asc"
    sort   "idTask"
    predecessors joinTable: [name: "activity_activity", key: "activity_id", column: "predecessor_id"]
    successors joinTable: [name: "activity_activity", key: "predecessor_id", column: "activity_id"]
  }
  int idTask;
  int duration;
  int est;
  int eet;
  int lst;
  int let;
  Date startDate;
  Date endDate;
  static transients = ['complete']
     int getComplete(){
	def t    = this.trackings.complete
        t?t.max():0
	}

  static constraints = {
    idMilestone()
    idTask()
    taskName()
    duration()
    resources(nullable:true)
    predecessors(nullable:true)
    successors(nullable:true)
    startDate(blank:false)
    endDate(blank:false)
    est(nullable:true)
    eet(nullable:true)
    lst(nullable:true)
    let(nullable:true)
  }
  static fetchMode = [resources:"eager",tracks:"eager"]
  String toString(){
    return "$taskName"
  }
  def getData(){
    def actv = Activity.executeQuery("select duration from Activity")
    if(actv[0]==null) actv=0
    actv?actv[0]:0
  }
  String getName() {
    if (null != taskName)
      return taskName.taskName
    else
      return id
  }
  int getTotalComplete() {
    int total = 0
      for (def tracking in trackings) {
        total += tracking.complete
      }
    return total
  }
  static printFields = ['idMilestone','taskName','duration','startDate','endDate','resources','complete']
}