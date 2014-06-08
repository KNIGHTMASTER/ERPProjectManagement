<%@ page import="WebPage.Integration" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'integration.label', default: 'Integration')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
          <div class="grid_7">
            <h1><strong>Initiating</strong></h1>
                <h3><u>Develop Project Charter</u></h3>
                <a href="../StatementOfWork/" class="dashboard-module">
                	<img src="../img/sow.jpg" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Statement Of Work</span>                        
                </a>                                           
                <a href="../ProjectProposal/" class="dashboard-module">
                	<img src="../img/int-proposal.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Project Proposal</span>
                </a>                  
                <a href="../BusinessCase/" class="dashboard-module">
                	<img src="../img/procure_pla.png" width="100" height="100" alt="edit" />
                	<span>Business Case</span>
                </a>                
               <a href="../FeasibilityStudy/" class="dashboard-module">
                	<img src="../img/int-feasibility.png" width="100" height="100" alt="edit" />
                        <span>Feasibility Study</span>
                </a>                  
               <a href="../ProjectAcceptance/" class="dashboard-module">
                	<img src="../img/apply.png" width="100" height="100" alt="edit" />
                        <span>Project Acceptance</span>
                </a>                                    
               <a href="../ProjectInformation/" class="dashboard-module">
                	<img src="../img/int-info.png" width="100" height="100" alt="edit" />
                        <span>Project Information</span>
                </a>                     
               <a href="../ReviewProjectProposal/" class="dashboard-module">
                	<img src="../img/int-review.png" width="100" height="100" alt="edit" />
                        <span>Review Project Proposal</span>
                </a>                                                       
               <a href="../ProjectCharter/" class="dashboard-module">
                	<img src="../img/projectcharter.png" width="100" height="100" alt="edit" />
                        <span>Project Charter</span>
                </a>                                       
                 <div style="clear: both"></div>                                                                                       
            </div> <!-- End .grid_7 -->
            
            <div class="grid_7">              
              <br />
              <br />
              <h1><strong>Planning</strong></h1>
                 <h3><u>Develop Project Management Plan</u></h3>
               <a href="../RequestProjectManagementPlan/" class="dashboard-module">
                	<img src="../img/int-request.png" width="100" height="100" alt="edit" />
                        <span>Request Project Management Plan</span>
                </a>                  
                 <a href="../ChangeManagementPlan/" class="dashboard-module">
                	<img src="../img/int-change.png" width="100" height="100" alt="edit" />
                        <span>Change Management Plan</span>
                </a>                 
                <a href="../DevelopProjectManagementPlan/" class="dashboard-module">
                	<img src="../img/int-plan.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Project Management Plan</span>
                </a>                                  
                 <div style="clear: both"></div>                                                                      
                 
            </div> <!-- End .grid_7 -->             
              <div class="grid_7">
                <br />                
                <br />        
                <br />
              <h1><strong>Executing</strong></h1>                
               <h3>Direct And Manage Project Execution</h3>
                <a href="../ManageTeamMemberAssignedToProject/" class="dashboard-module">
                	<img src="../img/int-member2.png" tppabs="http://www.xooom.pl/work/magicadmin/images/Crystal_Clear_write.gif" width="100" height="100" alt="edit" />
                	<span>Manage Team Member Assigned To Project</span>
                </a>  
                <a href="../ActivityTracking/" class="dashboard-module">
                	<img src="../img/int-performance.png" width="100" height="100" alt="edit" />
                	<span>Work Performance Information</span>
                </a>
               <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <h1> </h1>
             <h1> </h1> 
            
             <div class="grid_7">
               <br />
               <br />
              <h1><strong>Monitoring and Controlling</strong></h1>                               
              <h3><u>Monitoring And Controlling Project Execution</u></h3>
                <a href="../Perspektif/" class="dashboard-module">
                	<img src="../img/int-perspektif.png" width="100" height="100" alt="edit" />
                	<span>Data KPI</span>
                </a>
                <a href="../balancedScoreCard/" class="dashboard-module">
                	<img src="../img/int-bsc.png" width="100" height="100" alt="edit" />
                	<span>Balanced Scorecard</span>
                </a>
                <a href="../KPIBarChart/" class="dashboard-module">
                	<img src="../img/int-bar.png" width="100" height="100" alt="edit" />
                	<span>KPI Bar Chart</span>
                </a>               
               <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
               <div class="grid_7">
                 <br />
                 <h3><u>Perform Integrated Change Control</u></h3>
                  <!--<a href="../ChangeBoardApproval/" class="dashboard-module">
                	<img src="../img/int-change.png"  width="100" height="100" alt="edit" />
                	<span>Change Board Approval</span>
                </a>-->             
                  <a href="../ChangeRequest/" class="dashboard-module">
                	<img src="../img/int-changerequest.png"  width="100" height="100" alt="edit" />
                	<span>Change Request</span>
                </a>                              
                  <a href="../ManageChangeRequest/" class="dashboard-module">
                	<img src="../img/int-manage.png" width="100" height="100" alt="edit" />
                	<span>Manage Change Request</span>
                </a>                
                 <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
               <div class="grid_7">
                 <br />
                 <br />
              <h1><strong>Closing</strong></h1>                                 
              <h3><u>Close Project or Phase</u></h3>
                  <!--<a href="../CheckProjectPhase/" class="dashboard-module">
                	<img src="../img/int-checkproject.png" width="100" height="100" alt="edit" />
                	<span>Check Project Phase</span>
                </a>                
                  <a href="../PhaseRecord/" class="dashboard-module">
                	<img src="../img/int-steps.jpg"  width="100" height="100" alt="edit" />
                	<span>Phase Record</span>
                </a>  -->             
                  <a href="../ProjectRecord/" class="dashboard-module">
                	<img src="../img/int-steps2.jpg"  width="100" height="100" alt="edit" />
                	<span>Project Record</span>
                </a>                              
                  <%--<a href="../RecordAcceptance/" class="dashboard-module">
                	<img src="../img/int-record.png"  width="100" height="100" alt="edit" />
                	<span>Record Acceptance</span>
                  </a>--%>
                <a href="../HandOver/" class="dashboard-module">
                	<img src="../img/int-handover.png"  width="100" height="100" alt="edit" />
                	<span>Handover</span>
                </a>                                 
                <%--<a href="../HandOverAcceptance/" class="dashboard-module">
                	<img src="../img/int-handoveraccept.png"  width="100" height="100" alt="edit" />
                	<span>Handover Acceptance</span>
                </a>--%>
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->             
	</body>
</html>
