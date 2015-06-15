package ProjectProcurementManagement.CloseProcurements

class ProcPhoto{
    static belongsTo = [
                      materialName:ProjectProcurementManagement.CloseProcurements.CloseProcurement
                     ]
    byte [] photo
    
    static constraints = {
        materialName()
        photo()
    }
    String toString(){
            return "photo: $materialName"
        }
}
