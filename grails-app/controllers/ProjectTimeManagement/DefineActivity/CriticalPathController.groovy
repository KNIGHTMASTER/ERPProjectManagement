package ProjectTimeManagement.DefineActivity
import ProjectIntegrationManagement.DevelopProjectCharter.*

class CriticalPathController {
  def index() {
    def projects = StatementOfWork.list(sort: "projectName", order: "asc")
    def criticalPaths = [:]
    def totalCPs = [:]
    for (p in projects) {
      def activities = []
      for (t in p.tasks) {
        def activity = Activity.findByTaskName(t)
        if (activity != null)
          activities << activity
      }

      if (activities.size > 0) {
        def results = calculateCP(activities)
        criticalPaths[p] = results[0]
        totalCPs[p] = results[1]
      }
    }

    [criticalPaths: criticalPaths, totalCPs: totalCPs]
  }

  private def calculateCP(activities) {
    def results = criticalpath.CriticalPath.calculate(activities)
    def totalCP = criticalpath.CriticalPath.maxCost

    def criticalPaths = []

    for (def result : results) {
      if(result.isCritical()) {
        criticalPaths << result
      }
    }
    return [criticalPaths, totalCP]
  }
}
