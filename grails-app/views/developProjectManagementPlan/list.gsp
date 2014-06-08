
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'developProjectManagementPlan.label', default: 'DevelopProjectManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-developProjectManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a class="list" href="../ProjectManagementPlanAcceptance/"><g:message code="Approval"/></a></li>
			</ul>
		</div>
		<div id="list-developProjectManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="developProjectManagementPlan.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="planningVersion" title="${message(code: 'developProjectManagementPlan.planningVersion.label', default: 'Planning Version')}" />
					
						<th><g:message code="developProjectManagementPlan.changeManagementPlan.label" default="Change Management Plan" /></th>
					
						<th><g:message code="developProjectManagementPlan.scopeManagementPlan.label" default="Scope Management Plan" /></th>
					
						<th><g:message code="developProjectManagementPlan.communicationManagementPlan.label" default="Communication Management Plan" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'developProjectManagementPlan.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${developProjectManagementPlanInstanceList}" status="i" var="developProjectManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${developProjectManagementPlanInstance.id}">${fieldValue(bean: developProjectManagementPlanInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: developProjectManagementPlanInstance, field: "planningVersion")}</td>
					
						<td>${fieldValue(bean: developProjectManagementPlanInstance, field: "changeManagementPlan")}</td>
					
						<td>${fieldValue(bean: developProjectManagementPlanInstance, field: "scopeManagementPlan")}</td>
					
						<td>${fieldValue(bean: developProjectManagementPlanInstance, field: "communicationManagementPlan")}</td>
					
						<td><g:formatDate date="${developProjectManagementPlanInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${developProjectManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
