
<%@ page import="ProjectProcurementManagement.PlanProcurement.Approval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'approval.label', default: 'Approval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-approval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-approval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="approval.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="dateApproval" title="${message(code: 'approval.dateApproval.label', default: 'Date Approval')}" />
					
						<th><g:message code="approval.materialName.label" default="Material Name" /></th>
					
						<th><g:message code="approval.stakeholderRegister.label" default="Stakeholder Register" /></th>
					
						<g:sortableColumn property="accepted" title="${message(code: 'approval.accepted.label', default: 'Accepted')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'approval.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${approvalInstanceList}" status="i" var="approvalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${approvalInstance.id}">${fieldValue(bean: approvalInstance, field: "projectName")}</g:link></td>
					
						<td><g:formatDate date="${approvalInstance.dateApproval}" /></td>
					
						<td>${fieldValue(bean: approvalInstance, field: "materialName")}</td>
					
						<td>${fieldValue(bean: approvalInstance, field: "stakeholderRegister")}</td>
					
						<td><g:formatBoolean boolean="${approvalInstance.accepted}" /></td>
					
						<td>${fieldValue(bean: approvalInstance, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${approvalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
