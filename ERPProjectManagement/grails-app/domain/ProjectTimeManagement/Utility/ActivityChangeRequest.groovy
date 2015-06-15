package ProjectTimeManagement.Utility

class ActivityChangeRequest {
    //static belongsTo = [wbsChangeRequest:ProjectScopeManagement.ControlScope.Wbschangerequest]
    ProjectTimeManagement.DefineActivity.Activity    activity
    Date    changeDate
    String  description
    static constraints = {
        activity(blank: false)
        Date    changeDate
        description(maxSize:1000,nullable:true)
    }
    static printFields = ['activity','changeDate','description']
     String toString(){
         return "$activity: $changeDate"
        }
        static mapping = {
                 sort   "changeDate"
                 order  "asc"
	 }
}
