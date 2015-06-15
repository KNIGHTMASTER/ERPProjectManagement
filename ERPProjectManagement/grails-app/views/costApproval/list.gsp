
<%@ page import="ProjectCostManagement.CostApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costApproval.label', default: 'CostApproval')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-costApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-costApproval" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="costApproval.costManagementPlan.label" default="Cost Management Plan" /></th>
					
						<g:sortableColumn property="dateCreate" title="${message(code: 'costApproval.dateCreate.label', default: 'Date Create')}" />
					
						<g:sortableColumn property="accepted" title="${message(code: 'costApproval.accepted.label', default: 'Accepted')}" />
					
						<th><g:message code="costApproval.stakeholder.label" default="Stakeholder" /></th>
					
						<g:sortableColumn property="comment" title="${message(code: 'costApproval.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${costApprovalInstanceList}" status="i" var="costApprovalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${costApprovalInstance.id}">${fieldValue(bean: costApprovalInstance, field: "costManagementPlan")}</g:link></td>
					
						<td><g:formatDate date="${costApprovalInstance.dateCreate}" /></td>
					
						<td><g:formatBoolean boolean="${costApprovalInstance.accepted}" /></td>
					
						<td>${fieldValue(bean: costApprovalInstance, field: "stakeholder")}</td>
					
						<td>${fieldValue(bean: costApprovalInstance, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${costApprovalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
