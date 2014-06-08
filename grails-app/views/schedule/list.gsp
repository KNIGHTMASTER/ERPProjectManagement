
<%@ page import="WebPage.Schedule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'schedule.label', default: 'Schedule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
          <div class="grid_7">
            <h1>Tahap Planning</h1>
                <a href="../Milestones/" class="dashboard-module">
                	<img src="../img/17.png" width="100" height="100" alt="edit" />
                        <b><span>Milestones</span></b>
                </a>
            	<a href="../Task/" class="dashboard-module">
                	<img src="../img/6.png" width="100" height="100" alt="edit" />
                        <b><span>Task</span></b>
                </a>
                
                <a href="../Activity/" class="dashboard-module">
                	<img src="../img/7.png" width="100" height="100" alt="edit" />
                        <b><span>Time Management Plan</span></b>
                </a>
            
                <a href="../TimeApproval/" class="dashboard-module">
                	<img src="../img/apply.png" width="100" height="100" alt="edit" />
                        <b><span>Time Approval</span></b>
                </a>
            
                <a href="../DiagramActivity/" class="dashboard-module">
                	<img src="../img/12.png"  width="100" height="100" alt="edit" />
                        <b><span>Diagram Activity</span></b>
                </a>
            
                <a href="../Employee/" class="dashboard-module">
                	<img src="../img/14.png" width="100" height="100" alt="edit" />
                        <b><span>Employee</span></b>
                </a>
            
                <a href="../ResourcesCalendar/" class="dashboard-module">
                	<img src="../img/3.png"  width="100" height="100" alt="edit" />
                        <b><span>Resources Calendar</span></b>
                </a>
            
                <a href="../TeamDevelopment/" class="dashboard-module">
                	<img src="../img/8.png" width="100" height="100" alt="edit" />
                        <b><span>Team Development</span></b>
                </a>
            
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <h1> </h1>
             <h1> </h1>
             
            <div class="grid_7">
               <h1>Tahap Controlling</h1>
                 <a href="../ActivityTracking/" class="dashboard-module">
                	<img src="../img/4.png" width="100" height="100" alt="edit" />
                        <b><span>Activity Tracking</span></b>
                </a>
            
                <a href="../ActivityManday/" class="dashboard-module">
                	<img src="../img/20.png"  width="100" height="100" alt="edit" />
                        <b><span>Activity Manday</span></b>
                </a>
                
                <a href="/ERPProjectManagement/DelayActivity" class="dashboard-module">
                	<img src="../img/18.png"  width="100" height="100" alt="edit" />
                        <b><span>Delay</span></b>
                </a>
                <a href="/ERPProjectManagement/ActivityChangeRequest" class="dashboard-module">
                	<img src="../img/19.png"  width="100" height="100" alt="edit" />
                        <b><span>Activity Change Request</span></b>
                </a>
  
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
            
            <h1> </h1>
             <h1> </h1>
            <div class="grid_7">
               <h1>Monitoring</h1>
               
                <a href="/ERPProjectManagement/gantt" class="dashboard-module">
                	<img src="../img/15.png"  width="100" height="100" alt="edit" />
                        <b><span>Gantt Chart</span></b>
                </a>
               <a href="../CriticalPath/" class="dashboard-module">
                	<img src="../img/11.png"  width="100" height="100" alt="edit" />
                        <b><span>Critical Path</span></b>
                </a>
                <div style="clear: both"></div>
            </div> <!-- End .grid_7 -->
                
	</body>
</html>
