
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ProjectManagementPlanAcceptance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectManagementPlanAcceptance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectManagementPlanAcceptance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectManagementPlanAcceptance.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectManagementPlanAcceptance.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="acceptance" title="${message(code: 'projectManagementPlanAcceptance.acceptance.label', default: 'Acceptance')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'projectManagementPlanAcceptance.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'projectManagementPlanAcceptance.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectManagementPlanAcceptanceInstanceList}" status="i" var="projectManagementPlanAcceptanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectManagementPlanAcceptanceInstance.id}">${fieldValue(bean: projectManagementPlanAcceptanceInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectManagementPlanAcceptanceInstance, field: "stakeholder")}</td>
					
						<td><g:formatBoolean boolean="${projectManagementPlanAcceptanceInstance.acceptance}" /></td>
					
						<td>${fieldValue(bean: projectManagementPlanAcceptanceInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${projectManagementPlanAcceptanceInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectManagementPlanAcceptanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
