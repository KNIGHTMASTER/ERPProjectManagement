package ProjectHumanResourceManagement

class Salary {
static belongsTo = [employee:Employee]
    BigDecimal  value
    Date        startDate
    Date        endDate
    boolean     active
    String      comment

    static constraints = {
        employee(blank:false)
        value(blank:false)
        active(nullable:true)
        startDate(blank:false)
        endDate(nullable:true)
        comment(maxSize:500,nullable:true)
      
    }
    static searchable = {
         employee component:true
     }

    static printFields = ['employee','value','currency','active','startDate','endDate']

    String  toString(){
        if (this.active==true)
        return "$employee|$value"
    }
    static mapping = {
        lazy : false
                 sort   "employee"
                 order  "asc"
	 }
}
