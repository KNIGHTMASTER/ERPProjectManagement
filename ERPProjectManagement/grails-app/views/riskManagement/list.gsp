
<%@ page import="WebPage.RiskManagement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'riskManagement.label', default: 'RiskManagement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
  		<div class="grid_7">
                 <h1>Tahap Planning</h1>                
                <a href="../RiskCategories/" class="dashboard-module">
                	<img src="../img/risk_management_plan_icon.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Risk Management Planning</span>
                </a> 
                            
                
                <a href="../IdentificationCostManagementPlan/" class="dashboard-module">
                	<img src="../img/risk-icon2.jpg" width="100" height="100" alt="edit" />
                	<span>Risk Identification</span>
                </a>
                               
                  <a href="../AnalysisCostManagementPlan/" class="dashboard-module">
                	<img src="../img/8.png" width="100" height="100" alt="edit" />
                        <b><span>Qualitative Risk Analysis</span></b>
                        </a>
                  <a href="../AnalysisCostManagementPlan/" class="dashboard-module">
                	<img src="../img/pc.jpg" width="100" height="100" alt="edit" />
                        <b><span>Quantitative Risk Analysis</span></b>
                        </a>
                  
                  <a href="../RiskResponsePlanningQualitative/" class="dashboard-module">
                	<img src="../img/response.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Risk Response Planning</span>
                </a> 
                 
                   <div style="clear: both"></div>
                   </div> <!-- End .grid_7 -->
                <h1> </h1>
             <h1> </h1> 
             
             <div class="grid_7">
                <h1>Tahap Controlling</h1>
                                
                  <a href="../monitor/" class="dashboard-module">
                	<img src="../img/his.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Risk Monitoring & Controlling</span>
                </a>
                <a href="../RiskPriority/" class="dashboard-module">
                	<img src="../img/int-bar.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Chart Priority Risks</span>
                </a>
                  
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
                <h1> </h1>
             <h1> </h1> 
	</body>
</html>
