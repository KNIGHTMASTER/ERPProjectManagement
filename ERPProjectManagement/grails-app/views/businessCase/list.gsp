
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessCase.label', default: 'BusinessCase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-businessCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a class="list" href="../ExecutiveSummary/"><g:message code="Executive Summary"/></a></li>
                <li><a class="list" href="../BusinessCaseAnalysisTeam/"><g:message code="Business Case Analysis Team"/></a></li>
                <li><a class="list" href="../ProblemDefinition/"><g:message code="Problem Definition"/></a></li>
                <li><a class="list" href="../ProjectOverview/"><g:message code="Project Overview"/></a></li>
                <li><a class="list" href="../GoalsAndObjectives/"><g:message code="Goals And Objectives"/></a></li>
                <li><a class="list" href="../CostBenefitAnalysis/"><g:message code="Cost Benefit Analysis"/></a></li>
                <li><a class="list" href="../BusinessCaseApproval/"><g:message code="Approvals"/></a></li>
			</ul>
		</div>
		<div id="list-businessCase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="businessCase.projectName.label" default="Project Name" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${businessCaseInstanceList}" status="i" var="businessCaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${businessCaseInstance.id}">${fieldValue(bean: businessCaseInstance, field: "projectName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${businessCaseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
