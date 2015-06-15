
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeControlBoard.label', default: 'ChangeControlBoard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changeControlBoard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-changeControlBoard" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="changeControlBoard.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="changeControlBoard.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="role" title="${message(code: 'changeControlBoard.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="responsibility" title="${message(code: 'changeControlBoard.responsibility.label', default: 'Responsibility')}" />
					
						<g:sortableColumn property="authority" title="${message(code: 'changeControlBoard.authority.label', default: 'Authority')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changeControlBoardInstanceList}" status="i" var="changeControlBoardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changeControlBoardInstance.id}">${fieldValue(bean: changeControlBoardInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: changeControlBoardInstance, field: "stakeholder")}</td>
					
						<td>${fieldValue(bean: changeControlBoardInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: changeControlBoardInstance, field: "responsibility")}</td>
					
						<td>${fieldValue(bean: changeControlBoardInstance, field: "authority")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changeControlBoardInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
