
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposalApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectProposalApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectProposalApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectProposalApproval.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectProposalApproval.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'projectProposalApproval.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="approval" title="${message(code: 'projectProposalApproval.approval.label', default: 'Approval')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'projectProposalApproval.comments.label', default: 'Comments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectProposalApprovalInstanceList}" status="i" var="projectProposalApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectProposalApprovalInstance.id}">${fieldValue(bean: projectProposalApprovalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectProposalApprovalInstance, field: "stakeholder")}</td>
					
						<td><g:formatDate date="${projectProposalApprovalInstance.dateCreated}" /></td>
					
						<td><g:formatBoolean boolean="${projectProposalApprovalInstance.approval}" /></td>
					
						<td>${fieldValue(bean: projectProposalApprovalInstance, field: "comments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectProposalApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
