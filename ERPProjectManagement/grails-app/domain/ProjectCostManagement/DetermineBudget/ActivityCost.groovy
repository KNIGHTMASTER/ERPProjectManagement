package ProjectCostManagement.DetermineBudget

class ActivityCost {
    static belongsTo = [cost:Cost]
    static hasMany  = [humanResourceCost : HumanResourceCost]
    ProjectTimeManagement.DefineActivity.Activity activity = new ProjectTimeManagement.DefineActivity.Activity()
    boolean approve
    int day
    int workers
    BigDecimal total
    BigDecimal earnedValue
    BigDecimal actualCost
    BigDecimal ev
    static transients = ['day','workers','total','earnedValue','actualCost','ev', 'ac']
    
    int getDay(){
        return activity.duration
    }

    int getWorkers(){
        def teams = ProjectHumanResourceManagement.TeamDevelopment.executeQuery("select t.id from TeamDevelopment t where t.activity=${this.activity.id}")
        teams = ProjectHumanResourceManagement.TeamDevelopment.get(teams[0])
        teams = teams.teamMembers.id
        teams?teams.size():0
    }

    BigDecimal getTotal(){
	def hrCost = HumanResourceCost.executeQuery("select t from HumanResourceCost t where t.activityCost=${this.id}")
        if (hrCost){
            def tot=0
            hrCost.each{
                if(it.normalCost)
                tot+=it.normalCost
            }
           tot?:0
        }
        else return 0
    }
    BigDecimal getEarnedValue(){
        def hrCost = HumanResourceCost.executeQuery("select t from HumanResourceCost t where t.activityCost=${this.id}")
            def tot=0
            hrCost?hrCost.each{
                if(it.normalActualCost)
                tot+=it.normalActualCost
            }:0
           tot?:0
    }
    
    BigDecimal getEv(){
        this.getEarnedValue()
    }

    BigDecimal getAc(){
        this.getActualCost()
    }
    
    BigDecimal getActualCost(){
        def salary = SalaryHumanResource.executeQuery("select t from SalaryHumanResource t where t.humanResourceCost in(select m.id from HumanResourceCost m where m.activityCost=${this.id}) and isPayed=true")
            def tot=0
            salary?salary.each{
                if(it.normalCost)
                tot+=it.normalCost
            }:0
           tot?:0
    }

    static constraints = {
        cost(blank:false)
        activity(blank:false,unique:true)
        approve()
    }

   
    static printFields = ['cost','activity','day','workers','total']
    
    String  toString(){
        return "$activity: $cost"
    }

    static mapping = {
        cost lazy:false
        activity lazy:true
        order  "asc"
        sort   "activity"
    }

}