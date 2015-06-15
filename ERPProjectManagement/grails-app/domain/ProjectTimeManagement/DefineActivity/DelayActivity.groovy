package ProjectTimeManagement.DefineActivity

import groovy.time.*

class DelayActivity {
  static belongsTo = [ activity:Activity ]
  Date planningEndDate

  String toString(){
      return "${activity}"
  }
  int getDifference() {
    if (planningEndDate == null || activity == null || activity.endDate == null)
      return 0

    use(TimeCategory) {      
      def diff = planningEndDate - activity.endDate
      Math.abs(diff.days)
    }
  }
  static transients = ['difference']
}