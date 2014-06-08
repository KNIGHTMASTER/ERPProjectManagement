
<%@ page import="ProjectCommunicationManagement.DistributeInformation.DistributeInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'distributeInformation.label', default: 'DistributeInformation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-distributeInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-distributeInformation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="distributeInformation.projectCharter.label" default="Project Charter" /></th>
					
						<th><g:message code="distributeInformation.activityTracking.label" default="Activity Tracking" /></th>
					
						<g:sortableColumn property="summary" title="${message(code: 'distributeInformation.summary.label', default: 'Summary')}" />
					
						<g:sortableColumn property="workPlannedLastActivity" title="${message(code: 'distributeInformation.workPlannedLastActivity.label', default: 'Work Planned Last Activity')}" />
					
						<g:sortableColumn property="workPlannedNextActivity" title="${message(code: 'distributeInformation.workPlannedNextActivity.label', default: 'Work Planned Next Activity')}" />
					
						<g:sortableColumn property="openIssues" title="${message(code: 'distributeInformation.openIssues.label', default: 'Open Issues')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${distributeInformationInstanceList}" status="i" var="distributeInformationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${distributeInformationInstance.id}">${fieldValue(bean: distributeInformationInstance, field: "projectCharter")}</g:link></td>
					
						<td>${fieldValue(bean: distributeInformationInstance, field: "activityTracking")}</td>
					
						<td>${fieldValue(bean: distributeInformationInstance, field: "summary")}</td>
					
						<td>${fieldValue(bean: distributeInformationInstance, field: "workPlannedLastActivity")}</td>
					
						<td>${fieldValue(bean: distributeInformationInstance, field: "workPlannedNextActivity")}</td>
					
						<td>${fieldValue(bean: distributeInformationInstance, field: "openIssues")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${distributeInformationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
