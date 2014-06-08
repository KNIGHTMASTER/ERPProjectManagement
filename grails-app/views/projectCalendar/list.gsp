
<%@ page import="ProjectTimeManagement.DefineActivity.ProjectCalendar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectCalendar.label', default: 'ProjectCalendar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectCalendar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectCalendar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="projectCalendar.project.label" default="Project" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'projectCalendar.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="dayType" title="${message(code: 'projectCalendar.dayType.label', default: 'Day Type')}" />
					
						<g:sortableColumn property="workTime" title="${message(code: 'projectCalendar.workTime.label', default: 'Work Time')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'projectCalendar.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'projectCalendar.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectCalendarInstanceList}" status="i" var="projectCalendarInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectCalendarInstance.id}">${fieldValue(bean: projectCalendarInstance, field: "project")}</g:link></td>
					
						<td><g:formatDate date="${projectCalendarInstance.date}" /></td>
					
						<td>${fieldValue(bean: projectCalendarInstance, field: "dayType")}</td>
					
						<td>${fieldValue(bean: projectCalendarInstance, field: "workTime")}</td>
					
						<td><g:formatBoolean boolean="${projectCalendarInstance.active}" /></td>
					
						<td>${fieldValue(bean: projectCalendarInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectCalendarInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
