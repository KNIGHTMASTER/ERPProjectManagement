
<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.ProjectStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectStatus.label', default: 'ProjectStatus')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectStatus" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectStatus.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectStatus.workPerformanceInformation.label" default="Work Performance Information" /></th>
					
						<g:sortableColumn property="item" title="${message(code: 'projectStatus.item.label', default: 'Item')}" />
					
						<g:sortableColumn property="bad" title="${message(code: 'projectStatus.bad.label', default: 'Bad')}" />
					
						<g:sortableColumn property="good" title="${message(code: 'projectStatus.good.label', default: 'Good')}" />
					
						<g:sortableColumn property="excellent" title="${message(code: 'projectStatus.excellent.label', default: 'Excellent')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectStatusInstanceList}" status="i" var="projectStatusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectStatusInstance.id}">${fieldValue(bean: projectStatusInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectStatusInstance, field: "workPerformanceInformation")}</td>
					
						<td>${fieldValue(bean: projectStatusInstance, field: "item")}</td>
					
						<td>${fieldValue(bean: projectStatusInstance, field: "bad")}</td>
					
						<td>${fieldValue(bean: projectStatusInstance, field: "good")}</td>
					
						<td>${fieldValue(bean: projectStatusInstance, field: "excellent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectStatusInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
