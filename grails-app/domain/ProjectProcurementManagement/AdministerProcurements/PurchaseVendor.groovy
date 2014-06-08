package ProjectProcurementManagement.AdministerProcurements

class PurchaseVendor {

    static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]
    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    ProjectProcurementManagement.AdministerProcurements.MaterialResource material = new ProjectProcurementManagement.AdministerProcurements.MaterialResource()
    BigDecimal          pricePerUnit
    BigDecimal          priceTotal
    Date                purchaseDate
    
    int getPriceTotal(){
        return (material.amount * pricePerUnit)
    }
    static transients = ['priceTotal']
    
    static constraints = {
        projectName()
        material(blank:false)
        purchaseDate(nullable:true)
        pricePerUnit(blank:false)
    }
    String toString (){
        return "$material"
    }
}

