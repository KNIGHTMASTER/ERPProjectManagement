package ProjectHumanResourceManagement
import ProjectTimeManagement.EstimateResourceActivity.*
class TeamDevelopment {
    static belongsTo = [leader:Employee,activity:ProjectTimeManagement.DefineActivity.Activity]
    static hasMany = [teamMembers:Employee]
    ProjectTimeManagement.DefineActivity.Activity  activity
    Employee    leader
    String      description
    static constraints = {
        activity(blank:false,unique:true)
        leader(blank:false)
        teamMembers(blank:false)
        description(nullable:true,maxSize:500)
    }
    static printFields = ['activity','leader','teamMembers','description']
    String  toString(){
        return "$leader"
    }
}