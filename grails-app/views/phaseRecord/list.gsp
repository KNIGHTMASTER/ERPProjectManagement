
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.PhaseRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'phaseRecord.label', default: 'PhaseRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-phaseRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-phaseRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="phaseRecord.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectSummary" title="${message(code: 'phaseRecord.projectSummary.label', default: 'Project Summary')}" />
					
						<g:sortableColumn property="transitionToOperation" title="${message(code: 'phaseRecord.transitionToOperation.label', default: 'Transition To Operation')}" />
					
						<g:sortableColumn property="projectCost" title="${message(code: 'phaseRecord.projectCost.label', default: 'Project Cost')}" />
					
						<g:sortableColumn property="projectSchedule" title="${message(code: 'phaseRecord.projectSchedule.label', default: 'Project Schedule')}" />
					
						<g:sortableColumn property="recommendations" title="${message(code: 'phaseRecord.recommendations.label', default: 'Recommendations')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${phaseRecordInstanceList}" status="i" var="phaseRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${phaseRecordInstance.id}">${fieldValue(bean: phaseRecordInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: phaseRecordInstance, field: "projectSummary")}</td>
					
						<td>${fieldValue(bean: phaseRecordInstance, field: "transitionToOperation")}</td>
					
						<td>${fieldValue(bean: phaseRecordInstance, field: "projectCost")}</td>
					
						<td>${fieldValue(bean: phaseRecordInstance, field: "projectSchedule")}</td>
					
						<td>${fieldValue(bean: phaseRecordInstance, field: "recommendations")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${phaseRecordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
