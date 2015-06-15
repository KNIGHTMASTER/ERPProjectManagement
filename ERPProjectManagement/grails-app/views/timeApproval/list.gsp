
<%@ page import="ProjectTimeManagement.DevelopSchedule.TimeApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timeApproval.label', default: 'TimeApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-timeApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-timeApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="data display datatable" id="example">
				<thead>
					<tr>
					
						<th><g:message code="timeApproval.activity.label" default="Activity" /></th>
					
						<g:sortableColumn property="accepted" title="${message(code: 'timeApproval.accepted.label', default: 'Accepted')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'timeApproval.comment.label', default: 'Comment')}" />
					
						<th><g:message code="timeApproval.role.label" default="Role" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${timeApprovalInstanceList}" status="i" var="timeApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${timeApprovalInstance.id}">${fieldValue(bean: timeApprovalInstance, field: "activity")}</g:link></td>
					
						<td><g:formatBoolean boolean="${timeApprovalInstance.accepted}" /></td>
					
						<td>${fieldValue(bean: timeApprovalInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: timeApprovalInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${timeApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
