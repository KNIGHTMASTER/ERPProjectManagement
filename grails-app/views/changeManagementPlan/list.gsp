
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a class="list" href="../ChangeControlBoard/"><g:message code="Change Control Board List"/></a></li>
                                <li><a class="list" href="../DefinitionsOfChange/"><g:message code="Definitions Of Change"/></a></li>
			</ul>
		</div>
		<div id="list-changeManagementPlan" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="changeManagementPlan.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="changeManagementApproach" title="${message(code: 'changeManagementPlan.changeManagementApproach.label', default: 'Change Management Approach')}" />
					
						<g:sortableColumn property="datePrepared" title="${message(code: 'changeManagementPlan.datePrepared.label', default: 'Date Prepared')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changeManagementPlanInstanceList}" status="i" var="changeManagementPlanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changeManagementPlanInstance.id}">${fieldValue(bean: changeManagementPlanInstance, field: "projectName")}</g:link></td>
					
						<td>${changeManagementPlanInstance.changeManagementApproach}</td>
					
						<td><g:formatDate date="${changeManagementPlanInstance.datePrepared}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changeManagementPlanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
