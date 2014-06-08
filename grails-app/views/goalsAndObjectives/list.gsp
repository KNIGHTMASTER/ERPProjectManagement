
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.GoalsAndObjectives" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'goalsAndObjectives.label', default: 'GoalsAndObjectives')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-goalsAndObjectives" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-goalsAndObjectives" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="goalsAndObjectives.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="goalsAndObjective" title="${message(code: 'goalsAndObjectives.goalsAndObjective.label', default: 'Goals And Objective')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${goalsAndObjectivesInstanceList}" status="i" var="goalsAndObjectivesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${goalsAndObjectivesInstance.id}">${fieldValue(bean: goalsAndObjectivesInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: goalsAndObjectivesInstance, field: "goalsAndObjective")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${goalsAndObjectivesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
