
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.CheckProjectPhase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'checkProjectPhase.label', default: 'CheckProjectPhase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-checkProjectPhase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-checkProjectPhase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="checkProjectPhase.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="projectPhase" title="${message(code: 'checkProjectPhase.projectPhase.label', default: 'Project Phase')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${checkProjectPhaseInstanceList}" status="i" var="checkProjectPhaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${checkProjectPhaseInstance.id}">${fieldValue(bean: checkProjectPhaseInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: checkProjectPhaseInstance, field: "projectPhase")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${checkProjectPhaseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
