
<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeRequest.label', default: 'ChangeRequestCommunication')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changeRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-changeRequest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="changeRequest.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="dateRequested" title="${message(code: 'changeRequest.dateRequested.label', default: 'Date Requested')}" />
					
						<th><g:message code="changeRequest.changeRequestor.label" default="Change Requestor" /></th>
					
						<g:sortableColumn property="changeCategory" title="${message(code: 'changeRequest.changeCategory.label', default: 'Change Category')}" />
					
						<g:sortableColumn property="changeAffect" title="${message(code: 'changeRequest.changeAffect.label', default: 'Change Affect')}" />
					
						<g:sortableColumn property="changeRequested" title="${message(code: 'changeRequest.changeRequested.label', default: 'Change Requested')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changeRequestInstanceList}" status="i" var="changeRequestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changeRequestInstance.id}">${fieldValue(bean: changeRequestInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${changeRequestInstance.dateRequested}" /></td>
					
						<td>${fieldValue(bean: changeRequestInstance, field: "changeRequestor")}</td>
					
						<td>${fieldValue(bean: changeRequestInstance, field: "changeCategory")}</td>
					
						<td>${fieldValue(bean: changeRequestInstance, field: "changeAffect")}</td>
					
						<td>${fieldValue(bean: changeRequestInstance, field: "changeRequested")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changeRequestInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
