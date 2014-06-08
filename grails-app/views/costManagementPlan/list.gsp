
<%@ page import="ProjectCostManagement.DetermineBudget.CostManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costManagementPlan.label', default: 'CostManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-costManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-costManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="costManagementPlan.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="costManagementPlan.milestone.label" default="Milestone" /></th>
					
						<g:sortableColumn property="plannedValue" title="${message(code: 'costManagementPlan.plannedValue.label', default: 'Planned Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${costManagementPlanInstanceList}" status="i" var="costManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${costManagementPlanInstance.id}">${fieldValue(bean: costManagementPlanInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: costManagementPlanInstance, field: "milestone")}</td>
					
						<td>${fieldValue(bean: costManagementPlanInstance, field: "plannedValue")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${costManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
