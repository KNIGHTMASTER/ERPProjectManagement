
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.WorkRequirements" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workRequirements.label', default: 'WorkRequirements')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workRequirements" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-workRequirements" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="workRequirements.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="workPackage" title="${message(code: 'workRequirements.workPackage.label', default: 'Work Package')}" />
					
						<g:sortableColumn property="start" title="${message(code: 'workRequirements.start.label', default: 'Start')}" />
					
						<g:sortableColumn property="finish" title="${message(code: 'workRequirements.finish.label', default: 'Finish')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workRequirementsInstanceList}" status="i" var="workRequirementsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workRequirementsInstance.id}">${fieldValue(bean: workRequirementsInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: workRequirementsInstance, field: "workPackage")}</td>
					
						<td><g:formatDate date="${workRequirementsInstance.start}" /></td>
					
						<td><g:formatDate date="${workRequirementsInstance.finish}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workRequirementsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
