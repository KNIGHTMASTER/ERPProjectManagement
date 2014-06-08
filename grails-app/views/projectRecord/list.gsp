
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectRecord.label', default: 'ProjectRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectRecord.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectSummary" title="${message(code: 'projectRecord.projectSummary.label', default: 'Project Summary')}" />
					
						<g:sortableColumn property="transitionToOperation" title="${message(code: 'projectRecord.transitionToOperation.label', default: 'Transition To Operation')}" />

						<%--<th><g:message code="projectRecord.projectBudget.label" default="Project Budget" /></th>--%>
					
						<%--<g:sortableColumn property="qualityManagement" title="${message(code: 'projectRecord.qualityManagement.label', default: 'QualityRange Management')}" />--%>
					
						<%--<g:sortableColumn property="communicationManagement" title="${message(code: 'projectRecord.communicationManagement.label', default: 'Communication Management')}" />--%>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectRecordInstanceList}" status="i" var="projectRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectRecordInstance.id}">${fieldValue(bean: projectRecordInstance, field: "projectName")}</g:link></td>
					
						<td>${projectRecordInstance.projectSummary}</td>
					
						<td>${projectRecordInstance.transitionToOperation}</td>

						<%--<td>${fieldValue(bean: projectRecordInstance, field: "projectBudget")}</td>--%>
					
						<%--<td>${fieldValue(bean: projectRecordInstance, field: "qualityManagement")}</td>--%>
					
						<%--<td>${fieldValue(bean: projectRecordInstance, field: "communicationManagement")}</td>--%>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectRecordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
