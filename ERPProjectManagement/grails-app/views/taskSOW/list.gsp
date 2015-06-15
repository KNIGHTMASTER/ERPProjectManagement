
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.TaskSOW" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taskSOW.label', default: 'TaskSOW')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-taskSOW" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-taskSOW" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="taskSOW.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="taskSOW.workRequirement.label" default="Work Requirement" /></th>
					
						<g:sortableColumn property="task" title="${message(code: 'taskSOW.task.label', default: 'Task')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'taskSOW.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskSOWInstanceList}" status="i" var="taskSOWInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${taskSOWInstance.id}">${fieldValue(bean: taskSOWInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: taskSOWInstance, field: "workRequirement")}</td>
					
						<td>${fieldValue(bean: taskSOWInstance, field: "task")}</td>
					
						<td>${fieldValue(bean: taskSOWInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taskSOWInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
