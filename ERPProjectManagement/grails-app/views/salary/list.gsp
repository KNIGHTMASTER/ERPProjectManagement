
<%@ page import="ProjectHumanResourceManagement.Salary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salary.label', default: 'Salary')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-salary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-salary" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="salary.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="value" title="${message(code: 'salary.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'salary.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'salary.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'salary.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'salary.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${salaryInstanceList}" status="i" var="salaryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${salaryInstance.id}">${fieldValue(bean: salaryInstance, field: "employee")}</g:link></td>
					
						<td>${fieldValue(bean: salaryInstance, field: "value")}</td>
					
						<td><g:formatBoolean boolean="${salaryInstance.active}" /></td>
					
						<td><g:formatDate date="${salaryInstance.startDate}" /></td>
					
						<td><g:formatDate date="${salaryInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: salaryInstance, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${salaryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
