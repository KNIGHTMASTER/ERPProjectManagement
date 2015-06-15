
<%@ page import="WebPage.ScopeManagement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scopeManagement.label', default: 'ScopeManagement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
          <div class="grid_7">
            <h1><strong>Planning</strong></h1>
                <h3><u>Collect Requirements</u></h3>
                <a href="../RequirementsDocumentation/" class="dashboard-module">
                	<img src="../img/procure_s.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Requirements Documentation</span>                        
                </a>                   
                <!--<a href="../Baru/" class="dashboard-module">
                	<img src="../img/procure_s.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Baru</span>                        
                </a>-->                   
                <a href="../RequirementsManagementPlan/" class="dashboard-module">
                	<img src="../img/int-plan.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Requirement Management Plan</span>
                </a>                                   
                 <div style="clear: both"></div>
                 <br />
                 <br />
                <h3><u>Define Scope</u></h3>
                <a href="../ProjectScopeStatement/" class="dashboard-module">
                	<img src="../img/scp-scope.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Project Scope Statement</span>
                </a>                                   
                <a href="../ProjectDeliverable/" class="dashboard-module">
                	<img src="../img/scp-deliver.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Project Deliverables</span>
                </a>                                   
                 <div style="clear: both"></div>  
                 <br />
                <h3><u>Create WBS</u></h3>
                <!--<a href="../Wbs/" class="dashboard-module">
                	<img src="../img/wbs.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Wbs</span>                        
                </a>-->                   
                <a href="../DiagramActivity/" class="dashboard-module">
                	<img src="../img/wbs.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Wbs</span>                        
                </a>                
                <!--<a href="../ScopeBaseline/" class="dashboard-module">
                	<img src="../img/scp-baseline.PNG" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Scope Baseline</span>
                </a>-->
                 <div style="clear: both"></div>                   
            </div> <!-- End .grid_7 -->
            
            <div class="grid_7">              
              <br />
              <br />
              <h1><strong>Monitoring and Controlling</strong></h1>
                 <h3><u>Verify Scope</u></h3>
                <a href="../Inspection/" class="dashboard-module">
                	<img src="../img/scp-monitor.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Inspection</span>
                </a>                                     
               <!--<a href="../AcceptedDeliverable/" class="dashboard-module">
                	<img src="../img/apply.png" width="100" height="100" alt="edit" />
                        <span>Accepted Deliverable</span>
                </a>-->
            <%--<a href="../ChangeRequestCommunication/" class="dashboard-module">
                	<img src="../img/int-changerequest.png"  width="100" height="100" alt="edit" />
                	<span>Scope Change Request</span>
                </a>--%>
                 <div style="clear: both"></div>                 
              <br />
              <br />
                 <h3><u>Control Scope</u></h3>
               <a href="../VarianceAnalysis/" class="dashboard-module">
                	<img src="../img/scp-variance.png" width="100" height="100" alt="edit" />
                        <span>Variance Analysis</span>
                </a>                                                                                 
                 <div style="clear: both"></div>                                  
            </div> <!-- End .grid_7 -->                       
        </body>
</html>
