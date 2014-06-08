package ProjectHumanResourceManagement

class EmployeeType {
    static  hasMany   = [employee:Employee]
    String  type
    String  description
    
    static constraints = {
        type(blank:false,unique:true)
        description(nullable:true)
        employee()
    }
    static printFields = ['type','description','employee']

        String toString(){
            return "$type"
        }
        static mapping = {
        order  "asc"
        sort   "id"
    }
}
