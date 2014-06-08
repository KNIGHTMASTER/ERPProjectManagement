
<%@ page import="ProjectTimeManagement.DefineActivity.ActivityTracking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityTracking.label', default: 'ActivityTracking')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activityTracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/schedule"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a class="list" href="../status/"><g:message code="Project Status"/></a></li>
                <li><a class="list" href="../gantt/"><g:message code="Gantt Chart Project"/></a></li>
			</ul>
		</div>
		<div id="list-activityTracking" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="activityTracking.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'activityTracking.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="doWork" title="${message(code: 'activityTracking.doWork.label', default: 'Do Work')}" />
					
						<g:sortableColumn property="complete" title="${message(code: 'activityTracking.complete.label', default: 'Complete')}" />
					
						<g:sortableColumn property="hours" title="${message(code: 'activityTracking.hours.label', default: 'Hours')}" />
					
						<g:sortableColumn property="note" title="${message(code: 'activityTracking.note.label', default: 'Note')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityTrackingInstanceList}" status="i" var="activityTrackingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityTrackingInstance.id}">${fieldValue(bean: activityTrackingInstance, field: "activity")}</g:link></td>
					
						<td><g:formatDate date="${activityTrackingInstance.date}" /></td>
					
						<td>${fieldValue(bean: activityTrackingInstance, field: "doWork")}</td>
					
						<td>${fieldValue(bean: activityTrackingInstance, field: "complete")}</td>
					
						<td>${fieldValue(bean: activityTrackingInstance, field: "hours")}</td>
					
						<td>${fieldValue(bean: activityTrackingInstance, field: "note")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityTrackingInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
