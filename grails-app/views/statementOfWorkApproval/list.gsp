
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWorkApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-statementOfWorkApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-statementOfWorkApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="statementOfWorkApproval.statementOfWork.label" default="Statement Of Work" /></th>
					
						<th><g:message code="statementOfWorkApproval.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="approval" title="${message(code: 'statementOfWorkApproval.approval.label', default: 'Approval')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'statementOfWorkApproval.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'statementOfWorkApproval.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${statementOfWorkApprovalInstanceList}" status="i" var="statementOfWorkApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${statementOfWorkApprovalInstance.id}">${fieldValue(bean: statementOfWorkApprovalInstance, field: "statementOfWork")}</g:link></td>
					
						<td>${fieldValue(bean: statementOfWorkApprovalInstance, field: "stakeholder")}</td>
					
						<td><g:formatBoolean boolean="${statementOfWorkApprovalInstance.approval}" /></td>
					
						<td>${fieldValue(bean: statementOfWorkApprovalInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${statementOfWorkApprovalInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${statementOfWorkApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
