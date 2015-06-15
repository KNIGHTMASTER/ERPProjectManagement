package ProjectProcurementManagement.AdministerProcurements

class PerformanceVendor {

    static belongsTo = [
        ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter
    ]

    ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter projectName

    String vendorName
    String productQuality
    String onTimeDelivery
    String documentationQuality
    String developmentCost
    String developmentTime
    String costPerUnit
    String transactionalEfficiency
    String quality
    
    String analize
    static transients=['analize']
    
    String  getAnalize(){
        
        // probability Product QualityRange
        def PSproductQuality = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.productQuality='${this.productQuality}' and t.quality='SM'")
        PSproductQuality = PSproductQuality[0]   
        
        def PMproductQuality = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.productQuality='${this.productQuality}' and t.quality='M'") 
        PMproductQuality = PMproductQuality[0] 
        
        def PTproductQuality = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.productQuality='${this.productQuality}' and t.quality='TM'")
                    
        PTproductQuality = PTproductQuality[0]           
        
        // probability On Time Delivery
        def PSonTimeDelivery = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.onTimeDelivery='${this.onTimeDelivery}' and t.quality='SM'")
        PSonTimeDelivery = PSonTimeDelivery[0]   
        
        def PMonTimeDelivery = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.onTimeDelivery='${this.onTimeDelivery}' and t.quality='M'") 
        PMonTimeDelivery = PMonTimeDelivery[0]     
        
        def PTonTimeDelivery = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.onTimeDelivery='${this.onTimeDelivery}' and t.quality='TM'")              
        PTonTimeDelivery=PTonTimeDelivery[0]
        
        // probability Documentation QualityRange

        def PSdocumentationQuality = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.documentationQuality='${this.documentationQuality}' and t.quality='SM'")
        PSdocumentationQuality = PSdocumentationQuality[0]
        def PMdocumentationQuality = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.documentationQuality='${this.documentationQuality}' and t.quality='M'") 
        PMdocumentationQuality = PMdocumentationQuality[0]
        def PTdocumentationQuality = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.documentationQuality='${this.documentationQuality}' and t.quality='TM'")
        PTdocumentationQuality = PTdocumentationQuality[0]
        
        // probability Development Cost

        def PSdevelopmentCost = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.developmentCost='${this.developmentCost}' and t.quality='SM'")
        PSdevelopmentCost = PSdevelopmentCost=[0]
        def PMdevelopmentCost = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.developmentCost='${this.developmentCost}' and t.quality='M'") 
        PMdevelopmentCost = PMdevelopmentCost=[0]           
        def PTdevelopmentCost = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.developmentCost='${this.developmentCost}' and t.quality='TM'")
        PTdevelopmentCost = PTdevelopmentCost[0]
       
        // probability Development Time

        def PSdevelopmentTime = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.developmentTime='${this.developmentTime}' and t.quality='SM'")
        PSdevelopmentTime = PSdevelopmentTime[0]            
        def PMdevelopmentTime = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.developmentTime='${this.developmentTime}' and t.quality='M'") 
        PMdevelopmentTime=PMdevelopmentTime[0]
        def PTdevelopmentTime = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.developmentTime='${this.developmentTime}' and t.quality='TM'")
        PTdevelopmentTime=PTdevelopmentTime[0]            
        
        // probability Cost Per Unit

        def PScostPerUnit = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.costPerUnit='${this.costPerUnit}' and t.quality='SM'")
        PScostPerUnit=PScostPerUnit[0]
        def PMcostPerUnit = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.costPerUnit='${this.costPerUnit}' and t.quality='M'") 
        PMcostPerUnit=PMcostPerUnit[0]
        def PTcostPerUnit = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.costPerUnit='${this.costPerUnit}' and t.quality='TM'")
        PTcostPerUnit=PTcostPerUnit[0]
                    
        // probability Transactional Efficiency

        def PStransactionalEfficiency = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.transactionalEfficiency='${this.transactionalEfficiency}' and t.quality='SM'")
        PStransactionalEfficiency = PStransactionalEfficiency[0]
        
        def PMtransactionalEfficiency = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.transactionalEfficiency='${this.transactionalEfficiency}' and t.quality='M'") 
        PMtransactionalEfficiency = PMtransactionalEfficiency[0]
        
        def PTtransactionalEfficiency = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t " 
                        +"where t.transactionalEfficiency='${this.transactionalEfficiency}' and t.quality='TM'")
        PTtransactionalEfficiency = PTtransactionalEfficiency[0]
    
         // perhitungan probabilitas Vendor
         
        def NVendor =  ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t")
        NVendor = NVendor[0]
        
        def PS = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t where t.quality='SM'")
        PS=PS[0]
        
        def PM = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t where t.quality='M'")
        PM=PM[0]
        
        def PT = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t where t.quality='TM'")
        PT=PT[0]
        
        def PVendor = ProjectProcurementManagement.ConductProcurements.ProcurementHistory.executeQuery("select count(t.id) from ProcurementHistory t where t.vendorName='${this.vendorName}'") 
        PVendor=PVendor[0]
        
        def PSVendor = (PSproductQuality*PSonTimeDelivery*PSdocumentationQuality*PSdevelopmentCost*PSdevelopmentTime*PScostPerUnit*PStransactionalEfficiency)/(PS*(PVendor/NVendor+1))
        
        def PMVendor = (PSproductQuality*PSonTimeDelivery*PSdocumentationQuality*PSdevelopmentCost*PSdevelopmentTime*PScostPerUnit*PStransactionalEfficiency)/(PM*(PVendor/NVendor+1))
        
        def PTVendor = (PSproductQuality*PSonTimeDelivery*PSdocumentationQuality*PSdevelopmentCost*PSdevelopmentTime*PScostPerUnit*PStransactionalEfficiency)/(PT*(PVendor/NVendor+1))
        
        
        if(PSVendor>PMVendor && PSVendor>PTVendor)
            return "SM"
        if(PSVendor<PMVendor && PMVendor>PTVendor)
            return "M"
        if(PSVendor<PTVendor && PMVendor<PTVendor)
            return "TM"    
    }
    
    static constraints = {
        projectName()
        vendorName()
        productQuality(nullable:true,inList:["TM","M","SM"])
        onTimeDelivery(nullable:true,inList:["TM","M","SM"])
        documentationQuality(nullable:true,inList:["TM","M","SM"])
        developmentCost(nullable:true,inList:["TM","M","SM"])
        developmentTime(nullable:true,inList:["TM","M","SM"])
        costPerUnit(nullable:true,inList:["TM","M","SM"])
        transactionalEfficiency(nullable:true,inList:["TM","M","SM"])
        quality(nullable:true,inList:["TM","M","SM"])
    }
    String toString(){
        return "$vendorName: $quality"
    }
}
