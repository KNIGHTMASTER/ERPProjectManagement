
<%@ page import="ProjectCommunicationManagement.PlanCommunications.CommunicationManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-communicationManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-communicationManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="communicationManagementPlan.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="introduction" title="${message(code: 'communicationManagementPlan.introduction.label', default: 'Introduction')}" />
					
						<g:sortableColumn property="communicationManagementApproach" title="${message(code: 'communicationManagementPlan.communicationManagementApproach.label', default: 'Communication Management Approach')}" />
					
						<g:sortableColumn property="communicationManagementConstraints" title="${message(code: 'communicationManagementPlan.communicationManagementConstraints.label', default: 'Communication Management Constraints')}" />
					
						<g:sortableColumn property="stakeholderCommunicationRequirements" title="${message(code: 'communicationManagementPlan.stakeholderCommunicationRequirements.label', default: 'Stakeholder Communication Requirements')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${communicationManagementPlanInstanceList}" status="i" var="communicationManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${communicationManagementPlanInstance.id}">${fieldValue(bean: communicationManagementPlanInstance, field: "projectName")}</g:link></td>
					
						<td>${communicationManagementPlanInstance.introduction}</td>
					
						<td>${communicationManagementPlanInstance.communicationManagementApproach}</td>
					
						<td>${communicationManagementPlanInstance.communicationManagementConstraints}</td>
					
						<td>${communicationManagementPlanInstance.stakeholderCommunicationRequirements}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${communicationManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
