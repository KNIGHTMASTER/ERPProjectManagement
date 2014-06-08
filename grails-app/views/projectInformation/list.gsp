
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectInformation.label', default: 'ProjectInformation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectInformation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectInformation.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectStatus" title="${message(code: 'projectInformation.projectStatus.label', default: 'Project Status')}" />
					
						<g:sortableColumn property="acceptance" title="${message(code: 'projectInformation.acceptance.label', default: 'Acceptance')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInformationInstanceList}" status="i" var="projectInformationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectInformationInstance.id}">${fieldValue(bean: projectInformationInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectInformationInstance, field: "projectStatus")}</td>
					
						<td><g:formatBoolean boolean="${projectInformationInstance.acceptance}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectInformationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
