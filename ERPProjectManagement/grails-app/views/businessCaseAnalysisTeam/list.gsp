
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCaseAnalysisTeam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-businessCaseAnalysisTeam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-businessCaseAnalysisTeam" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="businessCaseAnalysisTeam.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="businessCaseAnalysisTeam.name.label" default="Name" /></th>
					
						<g:sortableColumn property="role" title="${message(code: 'businessCaseAnalysisTeam.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'businessCaseAnalysisTeam.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${businessCaseAnalysisTeamInstanceList}" status="i" var="businessCaseAnalysisTeamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${businessCaseAnalysisTeamInstance.id}">${fieldValue(bean: businessCaseAnalysisTeamInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: businessCaseAnalysisTeamInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: businessCaseAnalysisTeamInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: businessCaseAnalysisTeamInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${businessCaseAnalysisTeamInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
