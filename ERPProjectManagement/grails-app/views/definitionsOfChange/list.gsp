
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.DefinitionsOfChange" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-definitionsOfChange" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-definitionsOfChange" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="definitionsOfChange.changeManagementPlan.label" default="Change Management Plan" /></th>
					
						<g:sortableColumn property="scheduleChange" title="${message(code: 'definitionsOfChange.scheduleChange.label', default: 'Schedule Change')}" />
					
						<g:sortableColumn property="budgetChange" title="${message(code: 'definitionsOfChange.budgetChange.label', default: 'Budget Change')}" />
					
						<g:sortableColumn property="scopeChange" title="${message(code: 'definitionsOfChange.scopeChange.label', default: 'Scope Change')}" />
					
						<g:sortableColumn property="projectDocumentChanges" title="${message(code: 'definitionsOfChange.projectDocumentChanges.label', default: 'Project Document Changes')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${definitionsOfChangeInstanceList}" status="i" var="definitionsOfChangeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${definitionsOfChangeInstance.id}">${fieldValue(bean: definitionsOfChangeInstance, field: "changeManagementPlan")}</g:link></td>
					
						<td>${definitionsOfChangeInstance.scheduleChange}</td>
					
						<td>${definitionsOfChangeInstance.budgetChange}</td>
					
						<td>${definitionsOfChangeInstance.scopeChange}</td>
					
						<td>${definitionsOfChangeInstance.projectDocumentChanges}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${definitionsOfChangeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
