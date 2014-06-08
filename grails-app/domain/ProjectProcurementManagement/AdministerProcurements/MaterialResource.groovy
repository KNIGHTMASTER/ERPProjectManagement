package ProjectProcurementManagement.AdministerProcurements

class MaterialResource {
    
 static belongsTo = [
        ProjectTimeManagement.DefineActivity.Activity,
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
 ]
    ProjectTimeManagement.DefineActivity.Activity activity
    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName
 
    String material
    Integer    amount
    String     status
    Integer    available
    String     description

    static constraints = {
          projectName()
          activity ()
          material()
          amount()
          available()
          status(inList:["Pending","Approval","Open","Close","Failed"])
          description(nullable:true,maxSize:500)
    }
    static printFields = ['material','amount','available','status','description']
    
    String toString(){
           return "$material:$amount unit"
        }
     
    static mapping(){
        autoTimestamp true
    }
}