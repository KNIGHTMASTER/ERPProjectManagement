package ProjectScopeManagement.VerifyScope

class AcceptedDeliverable {
    static belongsTo = [
        deliverable : ProjectScopeManagement.DefineScope.ProjectDeliverable
    ]
    Boolean acceptance
    
    static constraints = {
        deliverable()
        acceptance()
    }
}
