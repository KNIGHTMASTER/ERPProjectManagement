
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.ProjectDeliverablesClose" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectDeliverablesClose" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectDeliverablesClose" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectDeliverablesClose.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectDeliverablesClose.milestone.label" default="Milestone" /></th>
					
						<th><g:message code="projectDeliverablesClose.plannedDeliverable.label" default="Planned Deliverable" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'projectDeliverablesClose.status.label', default: 'Status')}" />
					
						<th><g:message code="projectDeliverablesClose.projectRecord.label" default="Project Record" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectDeliverablesCloseInstanceList}" status="i" var="projectDeliverablesCloseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectDeliverablesCloseInstance.id}">${fieldValue(bean: projectDeliverablesCloseInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectDeliverablesCloseInstance, field: "milestone")}</td>
					
						<td>${fieldValue(bean: projectDeliverablesCloseInstance, field: "plannedDeliverable")}</td>
					
						<td>${fieldValue(bean: projectDeliverablesCloseInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: projectDeliverablesCloseInstance, field: "projectRecord")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectDeliverablesCloseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
