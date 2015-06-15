
<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ChangeRequestCommunication" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeRequestCommunication.label', default: 'ChangeRequestCommunication')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changeRequestCommunication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-changeRequestCommunication" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="changeRequestCommunication.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="dateRequested" title="${message(code: 'changeRequestCommunication.dateRequested.label', default: 'Date Requested')}" />
					
						<th><g:message code="changeRequestCommunication.changeRequestor.label" default="Change Requestor" /></th>
					
						<g:sortableColumn property="changeCategory" title="${message(code: 'changeRequestCommunication.changeCategory.label', default: 'Change Category')}" />
					
						<g:sortableColumn property="changeAffect" title="${message(code: 'changeRequestCommunication.changeAffect.label', default: 'Change Affect')}" />
					
						<g:sortableColumn property="changeRequested" title="${message(code: 'changeRequestCommunication.changeRequested.label', default: 'Change Requested')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changeRequestCommunicationInstanceList}" status="i" var="changeRequestCommunicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changeRequestCommunicationInstance.id}">${fieldValue(bean: changeRequestCommunicationInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${changeRequestCommunicationInstance.dateRequested}" /></td>
					
						<td>${fieldValue(bean: changeRequestCommunicationInstance, field: "changeRequestor")}</td>
					
						<td>${fieldValue(bean: changeRequestCommunicationInstance, field: "changeCategory")}</td>
					
						<td>${fieldValue(bean: changeRequestCommunicationInstance, field: "changeAffect")}</td>
					
						<td>${fieldValue(bean: changeRequestCommunicationInstance, field: "changeRequested")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changeRequestCommunicationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
