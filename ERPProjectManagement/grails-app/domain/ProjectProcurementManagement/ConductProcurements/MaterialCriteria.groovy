package ProjectProcurementManagement.ConductProcurements

class MaterialCriteria {
    String materialId
    String materialName
    String unitType
    int amount
    int available
    String note
    
    static constraints = {
        materialId()
        materialName()
        unitType(inList:["Item","Service"])
        amount(nullable:true)
        available(nullable:true)
        note(nullable:true,maxSize:500)
    }
    String toString(){
           return "$materialName"
        }
   
    static printFields = ['requirement','amount','available','note']
}

