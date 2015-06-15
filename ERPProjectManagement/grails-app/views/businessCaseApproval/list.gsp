
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCaseApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessCaseApproval.label', default: 'BusinessCaseApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-businessCaseApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-businessCaseApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="businessCaseApproval.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="businessCaseApproval.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="approval" title="${message(code: 'businessCaseApproval.approval.label', default: 'Approval')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'businessCaseApproval.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'businessCaseApproval.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${businessCaseApprovalInstanceList}" status="i" var="businessCaseApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${businessCaseApprovalInstance.id}">${fieldValue(bean: businessCaseApprovalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: businessCaseApprovalInstance, field: "stakeholder")}</td>
					
						<td><g:formatBoolean boolean="${businessCaseApprovalInstance.approval}" /></td>
					
						<td>${fieldValue(bean: businessCaseApprovalInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${businessCaseApprovalInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${businessCaseApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
