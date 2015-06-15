package criticalpath

import ProjectTimeManagement.DefineActivity.*

public class Task {
  public static HashMap<String, Task> tasksMap = new HashMap<String, Task>()
  public static Task getTask(Activity activity) {
    Task task = tasksMap.get(activity.getName())
    if (null == task) {
      task = new Task(activity)
      tasksMap.put(activity.getName(), task)
    }
    return task
  }

  public int cost
  public int criticalCost
  public String name
  public int earlyStart
  public int earlyFinish
  public int latestStart
  public int latestFinish
  public HashSet<Task> dependencies = new HashSet<Task>()

  protected Task(Activity activity) {
    this.name = activity.getName()
    this.cost = activity.getDuration()
    for (Activity a : activity.getSuccessors()) {
      this.dependencies.add(Task.getTask(a))
    }
    this.earlyFinish = -1
  }

  public void setLatest() {
    latestStart = CriticalPath.maxCost - criticalCost
    latestFinish = latestStart + cost
  }

  public int hashCode() {
    if (null == this.name) {
      return super.hashCode()
    }
    return this.name.hashCode()
  }

  public boolean equals(Object obj) {
    if (this == obj)
      return true
    if (obj == null)
      return false
    if (getClass() != obj.getClass())
      return false
    Task other = (Task) obj
    if (name == null) {
      if (other.name != null)
        return false
    } else if (!name.equals(other.name)) {
      return false
    }
    return true
  }

  public boolean isCritical() {
    return earlyStart == latestStart
  }
}
