package ProjectHumanResourceManagement

class Emphoto {
    static belongsTo = [employee:Employee]
    Employee    employee
    byte[]      photo
    static constraints = {
        employee(unique:true,blank:false)
        photo(nullable: true,maxSize:50000)
    }
    static mapping ={
        version false
    }
    String toString(){
            return "photo: $employee"
        }
}