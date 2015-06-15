package ProjectProcurementManagement.ConductProcurements

class BidderSelected {

    static belongsTo = [
                         materialName:ProjectProcurementManagement.PlanProcurement.Approval,    
                         vendorName:ProjectProcurementManagement.ConductProcurements.VendorRegister
                       ]
    
    String bidderType
    Date dateSelected
    String note
    
    static constraints = {
        
        vendorName(blank:false)
        materialName(blank:false)
        dateSelected(blank:true)
        bidderType(nullable:true,inList:["Auction","Directly","BuyDirectly"])
        note(nullable:true,maxSize:500)
    }
    String toString(){
        return "$vendorName"
    }
}
