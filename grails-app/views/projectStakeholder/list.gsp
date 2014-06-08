
<%@ page import="ProjectCommunicationManagement.PlanCommunications.ProjectStakeholder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectStakeholder.label', default: 'ProjectStakeholder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectStakeholder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectStakeholder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectStakeholder.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectStakeholder.role.label" default="Role" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'projectStakeholder.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'projectStakeholder.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="department" title="${message(code: 'projectStakeholder.department.label', default: 'Department')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'projectStakeholder.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectStakeholderInstanceList}" status="i" var="projectStakeholderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectStakeholderInstance.id}">${fieldValue(bean: projectStakeholderInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectStakeholderInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: projectStakeholderInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: projectStakeholderInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: projectStakeholderInstance, field: "department")}</td>
					
						<td>${fieldValue(bean: projectStakeholderInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectStakeholderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
