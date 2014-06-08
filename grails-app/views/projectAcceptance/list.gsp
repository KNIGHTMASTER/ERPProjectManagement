
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectAcceptance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectAcceptance.label', default: 'ProjectAcceptance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectAcceptance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectAcceptance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectAcceptance.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectAcceptance.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="acceptance" title="${message(code: 'projectAcceptance.acceptance.label', default: 'Acceptance')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'projectAcceptance.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'projectAcceptance.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectAcceptanceInstanceList}" status="i" var="projectAcceptanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectAcceptanceInstance.id}">${fieldValue(bean: projectAcceptanceInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectAcceptanceInstance, field: "stakeholder")}</td>
					
						<td><g:formatBoolean boolean="${projectAcceptanceInstance.acceptance}" /></td>
					
						<td>${fieldValue(bean: projectAcceptanceInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${projectAcceptanceInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectAcceptanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
