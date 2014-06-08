
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProblemDefinition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problemDefinition.label', default: 'ProblemDefinition')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-problemDefinition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-problemDefinition" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="problemDefinition.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="problemStatement" title="${message(code: 'problemDefinition.problemStatement.label', default: 'Problem Statement')}" />
					
						<g:sortableColumn property="organizationalImpact" title="${message(code: 'problemDefinition.organizationalImpact.label', default: 'Organizational Impact')}" />
					
						<g:sortableColumn property="technologyMigration" title="${message(code: 'problemDefinition.technologyMigration.label', default: 'Technology Migration')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${problemDefinitionInstanceList}" status="i" var="problemDefinitionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${problemDefinitionInstance.id}">${fieldValue(bean: problemDefinitionInstance, field: "projectName")}</g:link></td>
					
						<td>${problemDefinitionInstance.problemStatement}</td>
					
						<td>${problemDefinitionInstance.organizationalImpact}</td>
					
						<td>${problemDefinitionInstance.technologyMigration}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${problemDefinitionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
