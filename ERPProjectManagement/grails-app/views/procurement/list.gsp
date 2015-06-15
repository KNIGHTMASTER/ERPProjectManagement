
<%@ page import="WebPage.Procurement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'procurement.label', default: 'Procurement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
          
          
		<div class="grid_7">
                 <h1>Tahap Planning</h1>
                <a href="../MaterialCriteria/" class="dashboard-module">
                	<img src="../img/procure_s.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Material Criteria</span>
                </a> 
                  
                <a href="../Material/" class="dashboard-module">
                	<img src="../img/project_icon.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Material</span>
                </a>
                  
		<div class="grid_7">
                
                <a href="../RequirementProcurement/" class="dashboard-module">
                	<img src="../img/procure_pla.png" width="100" height="100" alt="edit" />
                	<span>Procurement Plan</span>
                </a>
                
               <a href="../Approval/" class="dashboard-module">
                	<img src="../img/apply.png" width="100" height="100" alt="edit" />
                        <b><span>Procurement Approval</span></b>
                </a>
                   
                  <div style="clear: both"></div>
                   </div> <!-- End .grid_7 -->
                <h1> </h1>
             <h1> </h1> 
               
             
             <div class="grid_7">
                <h1>Tahap Conduct</h1>
                <a href="../VendorRegister/" class="dashboard-module">
                	<img src="../img/procure_cal.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Vendor Register</span>
                </a>  
                
                <a href="../ procurementNegotiation/" class="dashboard-module">
                	<img src="../img/procurement2.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Negotiation</span>
                </a>  
               
                <a href="../BidderSelected/" class="dashboard-module">
                	<img src="../img/procure_bid.png" width="100" height="100" alt="edit" />
                	<span>Bidder</span>
                </a>
                
                <a href="../Contract/" class="dashboard-module">
                	<img src="../img/procure_contract.png" width="100" height="100" alt="edit" />
                	<span>Contract</span>
                </a>
                  
                <div style="clear: both"></div>
                   </div> <!-- End .grid_7 -->
                <h1> </h1>
             <h1> </h1> 
               
             <div class="grid_7">
                <h1>Tahap Administer</h1>
                <a href="../PurchaseVendor/" class="dashboard-module">
                	<img src="../img/procure_pur.png" width="100" height="100" alt="edit" />
                	<span>Purchase Order</span>
                </a>
                <a href="../ProcurementHistory/" class="dashboard-module">
                	<img src="../img/his.jpg" width="100" height="100" alt="edit" />
                	<span>Procurement History</span>
                </a>
                <a href="../PerformanceVendor/" class="dashboard-module">
                	<img src="../img/procure_nbc.PNG" width="100" height="100" alt="edit" />
                	<span>Performance Vendor</span>
                </a>
                <div style="clear: both"></div>
                   </div> <!-- End .grid_7 -->
                <h1> </h1>
             <h1> </h1> 
             
              <div class="grid_7">
                <h1>Tahap Closing</h1>
                  <a href="../CloseProcurement/" class="dashboard-module">
                	<img src="../img/procure_plan.jpg" width="100" height="100" alt="edit" />
                	<span>Procurement Closure</span>
                </a>
                
                  <a href="../ProcPhoto/" class="dashboard-module">
                	<img src="../img/procure_as.png"  width="100" height="100" alt="edit" />
                	<span>Procurement Photo</span>
                </a>
  
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
                <h1> </h1>
             <h1> </h1> 
             
	</body>
</html>
