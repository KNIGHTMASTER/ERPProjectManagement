package criticalpath

import ProjectTimeManagement.DefineActivity.*

class CriticalPath {
  private CriticalPath() {}

  public static int maxCost;

  public static Task[] calculate(List<Activity> activities) {
    Set tasks = new HashSet()
    for (Activity act : activities) {
      tasks.add(Task.getTask(act))   //Memperoleh nama task dalam class activity
    }
    return CriticalPath.calculate(tasks)
  }

  public static Task[] calculate(Set<Task> tasks) {
    Task.tasksMap.clear()
    HashSet<Task> completed = new HashSet<Task>()
    HashSet<Task> remaining = new HashSet<Task>(tasks)

    while (!remaining.isEmpty()) {
      boolean progress = false

      for (Iterator<Task> iter = remaining.iterator(); iter.hasNext();) {
        Task task = iter.next()
        if (completed.containsAll(task.dependencies)) {
          int critical = 0
          for (Task t : task.dependencies) {
            if (t.criticalCost > critical) {
              critical = t.criticalCost
            }
          }
          task.criticalCost = critical + task.cost   //Menghitung durasi keseluruhan
          completed.add(task)
          iter.remove()
          progress = true
        }
      }
      if (!progress)
        throw new RuntimeException("Perputaran ketergantungan predecessors terdeteksi, harap periksa aktivitas / task")
    }

    maxCost(tasks)
    HashSet<Task> initialNodes = initials(tasks)
    calculateEarly(initialNodes)

    Task[] ret = completed.toArray(new Task[0])
    Arrays.sort(ret, new Comparator<Task>() {
      @Override
      public int compare(Task o1, Task o2) {
        if (o1.latestStart < o2.latestStart)
          if (o1.latestFinish < o2.latestFinish)
            return -1
        return 1
      }
    })

    return ret
  }

  public static void calculateEarly(HashSet<Task> initials) {
    for (Task initial : initials) {
      initial.earlyStart = 0
      initial.earlyFinish = initial.cost
      setEarly(initial)
    }
  }

  public static void setEarly(Task initial) {
    int completionTime = initial.earlyFinish
    for (Task t : initial.dependencies) {
      if (completionTime >= t.earlyStart) {
        t.earlyStart = completionTime
        t.earlyFinish = completionTime + t.cost
      }
      setEarly(t)
    }
  }

  public static HashSet<Task> initials(Set<Task> tasks) {
    HashSet<Task> remaining = new HashSet<Task>(tasks)
    for (Task t : tasks) {
      for (Task td : t.dependencies) {
        remaining.remove(td)
      }
    }
    return remaining
  }

  public static void maxCost(Set<Task> tasks) {
    int max = -1
    for (Task t : tasks) {
      if (t.criticalCost > max)
        max = t.criticalCost
    }
    maxCost = max
    for (Task t : tasks) {
      t.setLatest()
    }
  }
}
