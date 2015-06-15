package ProjectTimeManagement.DefineActivity

class ActivityTracking {
    static belongsTo = [Activity]

    Activity activity

    Date        date
    String      doWork
    int         complete
    int         hours
    String      note
    
    
    static constraints = {
        activity(blank:false)
        date(blank:false)
        doWork(blank:false)
        complete(nullable:true,range:0..100)
        hours(nullable:true,range:0..24)
        note(nullable:true,maxSize:500)
    }
    String toString(){
        return complete
    }
    
    static printFields = ['date','activity','doWork','complete','hours']
    static mapping = {
                 sort   "id"
	 }
}