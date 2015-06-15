
<%@ page import="ProjectTimeManagement.EstimateResourceActivity.ActivityManday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityManday.label', default: 'ActivityManday')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityManday" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activityManday" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'activityManday.date.label', default: 'Date')}" />
					
						<th><g:message code="activityManday.activity.label" default="Activity" /></th>
					
						<th><g:message code="activityManday.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="doWork" title="${message(code: 'activityManday.doWork.label', default: 'Do Work')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'activityManday.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="startWorks" title="${message(code: 'activityManday.startWorks.label', default: 'Start Works')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityMandayInstanceList}" status="i" var="activityMandayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityMandayInstance.id}">${fieldValue(bean: activityMandayInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: activityMandayInstance, field: "activity")}</td>
					
						<td>${fieldValue(bean: activityMandayInstance, field: "employee")}</td>
					
						<td>${fieldValue(bean: activityMandayInstance, field: "doWork")}</td>
					
						<td>${fieldValue(bean: activityMandayInstance, field: "description")}</td>
					
						<td><g:formatDate date="${activityMandayInstance.startWorks}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityMandayInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
