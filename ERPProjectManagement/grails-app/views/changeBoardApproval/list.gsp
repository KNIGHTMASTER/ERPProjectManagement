
<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeBoardApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-changeBoardApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-changeBoardApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="changeBoardApproval.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="changeBoardApproval.changeRequest.label" default="Change Request" /></th>
					
						<th><g:message code="changeBoardApproval.peopleWhoApprove.label" default="People Who Approve" /></th>
					
						<g:sortableColumn property="acceptance" title="${message(code: 'changeBoardApproval.acceptance.label', default: 'Acceptance')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'changeBoardApproval.comments.label', default: 'Comments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${changeBoardApprovalInstanceList}" status="i" var="changeBoardApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${changeBoardApprovalInstance.id}">${fieldValue(bean: changeBoardApprovalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: changeBoardApprovalInstance, field: "changeRequest")}</td>
					
						<td>${fieldValue(bean: changeBoardApprovalInstance, field: "peopleWhoApprove")}</td>
					
						<td><g:formatBoolean boolean="${changeBoardApprovalInstance.acceptance}" /></td>
					
						<td>${fieldValue(bean: changeBoardApprovalInstance, field: "comments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${changeBoardApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
