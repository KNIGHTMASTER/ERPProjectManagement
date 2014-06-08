
<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.WorkPerformanceInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workPerformanceInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-workPerformanceInformation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="workPerformanceInformation.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="dateEnding" title="${message(code: 'workPerformanceInformation.dateEnding.label', default: 'Date Ending')}" />
					
						<g:sortableColumn property="workPlannedLastStep" title="${message(code: 'workPerformanceInformation.workPlannedLastStep.label', default: 'Work Planned Last Step')}" />
					
						<g:sortableColumn property="workCompletedLastStep" title="${message(code: 'workPerformanceInformation.workCompletedLastStep.label', default: 'Work Completed Last Step')}" />
					
						<g:sortableColumn property="workPlannedNextStep" title="${message(code: 'workPerformanceInformation.workPlannedNextStep.label', default: 'Work Planned Next Step')}" />
					
						<th><g:message code="workPerformanceInformation.activity.label" default="Activity" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workPerformanceInformationInstanceList}" status="i" var="workPerformanceInformationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workPerformanceInformationInstance.id}">${fieldValue(bean: workPerformanceInformationInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${workPerformanceInformationInstance.dateEnding}" /></td>
					
						<td>${fieldValue(bean: workPerformanceInformationInstance, field: "workPlannedLastStep")}</td>
					
						<td>${fieldValue(bean: workPerformanceInformationInstance, field: "workCompletedLastStep")}</td>
					
						<td>${fieldValue(bean: workPerformanceInformationInstance, field: "workPlannedNextStep")}</td>
					
						<td>${fieldValue(bean: workPerformanceInformationInstance, field: "activity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workPerformanceInformationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
