
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectOverview" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectOverview.label', default: 'ProjectOverview')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectOverview" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectOverview" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectOverview.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectDescription" title="${message(code: 'projectOverview.projectDescription.label', default: 'Project Description')}" />
					
						<g:sortableColumn property="projectAssumptions" title="${message(code: 'projectOverview.projectAssumptions.label', default: 'Project Assumptions')}" />
					
						<g:sortableColumn property="projectConstraints" title="${message(code: 'projectOverview.projectConstraints.label', default: 'Project Constraints')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectOverviewInstanceList}" status="i" var="projectOverviewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectOverviewInstance.id}">${fieldValue(bean: projectOverviewInstance, field: "projectName")}</g:link></td>
					
						<td>${projectOverviewInstance.projectDescription}</td>
					
						<td>${projectOverviewInstance.projectAssumptions}</td>
					
						<td>${projectOverviewInstance.projectConstraints}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectOverviewInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
