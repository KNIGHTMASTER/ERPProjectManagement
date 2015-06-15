
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requirementsManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
			</ul>
		</div>
		<div id="list-requirementsManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="requirementsManagementPlan.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="requirementsCollection" title="${message(code: 'requirementsManagementPlan.requirementsCollection.label', default: 'Requirements Collection')}" />
					
						<g:sortableColumn property="categories" title="${message(code: 'requirementsManagementPlan.categories.label', default: 'Categories')}" />
					
						<g:sortableColumn property="prioritization" title="${message(code: 'requirementsManagementPlan.prioritization.label', default: 'Prioritization')}" />
					
						<g:sortableColumn property="traceability" title="${message(code: 'requirementsManagementPlan.traceability.label', default: 'Traceability')}" />
					
						<g:sortableColumn property="configurationManagement" title="${message(code: 'requirementsManagementPlan.configurationManagement.label', default: 'Configuration Management')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requirementsManagementPlanInstanceList}" status="i" var="requirementsManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requirementsManagementPlanInstance.id}">${fieldValue(bean: requirementsManagementPlanInstance, field: "projectName")}</g:link></td>
					
						<td>${requirementsManagementPlanInstance.requirementsCollection}</td>
					
						<td>${requirementsManagementPlanInstance.categories}</td>
					
						<td>${requirementsManagementPlanInstance.prioritization}</td>
					
						<td>${requirementsManagementPlanInstance.traceability}</td>
					
						<td>${requirementsManagementPlanInstance.configurationManagement}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requirementsManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
