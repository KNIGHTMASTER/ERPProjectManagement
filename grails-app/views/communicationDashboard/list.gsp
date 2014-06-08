
<%@ page import="WebPage.CommunicationDashboard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationDashboard.label', default: 'CommunicationDashboard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <resource:reflectionImage />
        <script type="text/javascript">
            //initiating
            $(document).ready(function(){
                $("#initiating").click(function(){
                    $("#initiatingContent").slideToggle("slow");
                });
            });
            $(document).ready(function(){
                $("#planning").click(function(){
                    $("#planContainer").slideToggle("slow");
                });
            });
            $(document).ready(function(){
                $("#executing").click(function(){
                    $("#executeContainer").slideToggle("slow");
                });
            });
            $(document).ready(function(){
                $("#monitoring").click(function(){
                    $("#monitorContainer").slideToggle("slow");
                });
            });
        </script>
	</head>
	<body>
        <h1 id="initiating"><strong>Initiating</strong></h1>
        <div id="initiatingContent" style="display: none">
            <h3><u>Identify Stakeholder</u></h3>
            <a href="../stakeholderRegister/" class="dashboard-module">
                <%--<richui:reflectionImage src="${createLinkTo('dir': 'images', file: 'stakeholderRegister.png')}" />--%>
                <img src="../images/stakeholderRegister.png" width="100" height="100" alt="edit" />

                <span>Stakeholder Register</span>
            </a>
            <a href="../stakeholderManagementStrategy/" class="dashboard-module">
                <%--<richui:reflectionImage src="${createLinkTo('dir': 'images', file: 'stakeholderManagementStrategy.png')}" />--%>
                <img src="../images/stakeholderManagementStrategy.png" width="100" height="100" alt="edit" />
                <span>Stakeholder Management Strategy</span>
            </a>
            <div style="clear: both"></div>
            <br>
        </div>
        <h1 id="planning"><strong>Planning</strong></h1>
        <div id="planContainer" style="display: none">
            <h3><u>Plan Communications</u></h3>
            <a href="../communicationManagementPlan/" class="dashboard-module">
                <img src="../images/Communication.png" width="100" height="100" alt="edit" />
                <span>Communication Management Plan</span>
            </a>
            <div style="clear: both"></div>
            <br>
            <br>
        </div>
            <h1 id="executing"><strong>Executing</strong></h1>
            <div id="executeContainer" style="display: none">
                <h3><u>Distribute Information</u></h3>
                <a href="../distributeInformation/" class="dashboard-module">
                    <img src="../images/distributeInformation.png"  width="100" height="100" alt="edit" />
                    <span>Distribute Information</span>
                </a>
                <div style="clear: both"></div>
                <br>
                <h3 ><u>Manage Stakeholder Expectations</u></h3>
                <a href="../projectResponses/" class="dashboard-module">
                    <img src="../images/Response.png"  width="100" height="100" alt="edit" />
                    <span>Project Responses</span>
                </a>
                <a href="../changeRequestCommunication/" class="dashboard-module">
                    <img src="../img/int-changerequest.png"  width="100" height="100" alt="edit" />
                    <span>Change Request</span>
                </a>
                <div style="clear: both"></div>
                <br>
            </div>

         <h1 id="monitoring"><strong>Monitoring and Controlling</strong></h1>
        <div id="monitorContainer" style="display: none">
            <h3><u>Report Performance</u></h3>
            <a href="../reportPerformance/" class="dashboard-module">
                <img src="../images/Performance.png"  width="100" height="100" alt="edit" />
                <span>Performance Report</span>
            </a>
            <div style="clear: both"></div>
            <br>
        </div>
	</body>
</html>
