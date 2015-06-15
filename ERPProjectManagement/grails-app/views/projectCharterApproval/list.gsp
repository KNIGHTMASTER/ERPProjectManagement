
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharterApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-projectCharterApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-projectCharterApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="projectCharterApproval.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="projectCharterApproval.stakeholder.label" default="Stakeholder" /></th>
					
						<th><g:message code="projectCharterApproval.projectCharter.label" default="Project Charter" /></th>
					
						<g:sortableColumn property="acceptance" title="${message(code: 'projectCharterApproval.acceptance.label', default: 'Acceptance')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'projectCharterApproval.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'projectCharterApproval.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectCharterApprovalInstanceList}" status="i" var="projectCharterApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${projectCharterApprovalInstance.id}">${fieldValue(bean: projectCharterApprovalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: projectCharterApprovalInstance, field: "stakeholder")}</td>
					
						<td>${fieldValue(bean: projectCharterApprovalInstance, field: "projectCharter")}</td>
					
						<td><g:formatBoolean boolean="${projectCharterApprovalInstance.acceptance}" /></td>
					
						<td>${fieldValue(bean: projectCharterApprovalInstance, field: "comments")}</td>
					
						<td><g:formatDate date="${projectCharterApprovalInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectCharterApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
