package ProjectHumanResourceManagement

class Employee {
    static belongsTo = [
        employeeType:EmployeeType,
        project:ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork
    ]

    EmployeeType employeeType
    ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork project

    static  hasMany   = [photo:Emphoto]
    String idEmployee;
    String name;
    String sex;
    String address;
    String bornPlace;
    Date birthday;
    String phone;
    String email;
    String website;
    
    static constraints = {
            project(blank:false)
            idEmployee(unique:true, blank:false)
            name(blank:false)
            employeeType(blank:false)
            sex(inList:["Male", "Female"])
            address(blank:false)
            bornPlace(blank:false)
            birthday(nullable:true)
            phone(nullable:true)
            email(nullable:true)
            website(nullable:true)
    }
static printFields = ['idEmployee','name','employeeType','sex','address','bornPlace','birthday','phone','email','website']
    String toString(){
        return "$name"
    }
    static mapping = {
                 sort   "name"
                 order  "asc"
	 }
}