
<%@ page import="ProjectProcurementManagement.PlanProcurement.RequirementProcurement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementProcurement.label', default: 'RequirementProcurement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requirementProcurement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-requirementProcurement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="requirementProcurement.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="requirementProcurement.activity.label" default="Activity" /></th>
					
						<th><g:message code="requirementProcurement.materialName.label" default="Material Name" /></th>
					
						<g:sortableColumn property="startDate" title="${message(code: 'requirementProcurement.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'requirementProcurement.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'requirementProcurement.amount.label', default: 'Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requirementProcurementInstanceList}" status="i" var="requirementProcurementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requirementProcurementInstance.id}">${fieldValue(bean: requirementProcurementInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: requirementProcurementInstance, field: "activity")}</td>
					
						<td>${fieldValue(bean: requirementProcurementInstance, field: "materialName")}</td>
					
						<td><g:formatDate date="${requirementProcurementInstance.startDate}" /></td>
					
						<td><g:formatDate date="${requirementProcurementInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: requirementProcurementInstance, field: "amount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requirementProcurementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
