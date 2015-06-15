package ProjectIntegrationManagement.DevelopProjectCharter
import ProjectTimeManagement.DefineActivity.*

class StatementOfWork {
    String projectName
    String introduction
    Date dateCreated    
    String scopeOfWork       
    String otherRequirements    
    int idProject
    
    static mapping = {
        id column: 'idProject'         
    }
               
    /*int getIdProject(){
        return this.idProject
    }*/
    
 def beforeInsert() {
    def lastIdProject = StatementOfWork.list([sort: 'idProject', order:'desc', max: 1])
    if(lastIdProject)
      idProject = (lastIdProject.pop().idProject as int) + 1
    else
      idProject = '0'
  }
  
    static hasMany = 
    [
        //projectProposals:ProjectProposal,
        statementOfWorkApprovals:StatementOfWorkApproval,
        periodOfPerformance:PeriodOfPerformance,
        placeOfPerformance:PlaceOfPerformance,        
        workRequirements:WorkRequirements,
        milestones:Milestones, 
        tasks:Task,
        acceptanceCriteria:AcceptanceCriteria
    ]
       
    
    String toString(){
        return projectName;
    }

   static def reportable = [:]
   /*def static reportable = [
        title: 'Statement Of Work',
        fileName: 'StatementOfWork',
        columns: ['introduction', 'scopeOfWork', 'otherRequirements']
    ]*/

    static printFields = ['projectName','dateCreated','introduction','placeOfPerformance','periodOfPerformance','statementOfWorkApprovals']

    static constraints = {
        idProject(unique:true)
        dateCreated()        
        projectName()
        introduction(maxSize:2000)        
        scopeOfWork(maxSize:2000)
        otherRequirements(maxSize:2000)
        placeOfPerformance()
        periodOfPerformance()
        workRequirements()
        acceptanceCriteria()        
        statementOfWorkApprovals()        
    }
}

