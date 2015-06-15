
<%@ page import="ProjectHumanResourceManagement.TeamDevelopment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamDevelopment.label', default: 'TeamDevelopment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-teamDevelopment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-teamDevelopment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="teamDevelopment.activity.label" default="Activity" /></th>
					
						<th><g:message code="teamDevelopment.leader.label" default="Leader" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'teamDevelopment.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamDevelopmentInstanceList}" status="i" var="teamDevelopmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teamDevelopmentInstance.id}">${fieldValue(bean: teamDevelopmentInstance, field: "activity")}</g:link></td>
					
						<td>${fieldValue(bean: teamDevelopmentInstance, field: "leader")}</td>
					
						<td>${fieldValue(bean: teamDevelopmentInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${teamDevelopmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
