
<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ManageChangeRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-manageChangeRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-manageChangeRequest" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="manageChangeRequest.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="dateRequested" title="${message(code: 'manageChangeRequest.dateRequested.label', default: 'Date Requested')}" />
					
						<g:sortableColumn property="dateApproved" title="${message(code: 'manageChangeRequest.dateApproved.label', default: 'Date Approved')}" />
					
						<g:sortableColumn property="approval" title="${message(code: 'manageChangeRequest.approval.label', default: 'Approval')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'manageChangeRequest.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="recommendedAction" title="${message(code: 'manageChangeRequest.recommendedAction.label', default: 'Recommended Action')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${manageChangeRequestInstanceList}" status="i" var="manageChangeRequestInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${manageChangeRequestInstance.id}">${fieldValue(bean: manageChangeRequestInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${manageChangeRequestInstance.dateRequested}" /></td>
					
						<td><g:formatDate date="${manageChangeRequestInstance.dateApproved}" /></td>
					
						<td><g:formatBoolean boolean="${manageChangeRequestInstance.approval}" /></td>
					
						<td>${fieldValue(bean: manageChangeRequestInstance, field: "comments")}</td>
					
						<td>${fieldValue(bean: manageChangeRequestInstance, field: "recommendedAction")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${manageChangeRequestInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
