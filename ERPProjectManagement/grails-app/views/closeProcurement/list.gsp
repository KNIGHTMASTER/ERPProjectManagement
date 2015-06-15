
<%@ page import="ProjectProcurementManagement.CloseProcurements.CloseProcurement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'closeProcurement.label', default: 'CloseProcurement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-closeProcurement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-closeProcurement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="closeProcurement.projectName.label" default="Project Name" /></th>
					
						<th><g:message code="closeProcurement.materialName.label" default="Material Name" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'closeProcurement.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="complete" title="${message(code: 'closeProcurement.complete.label', default: 'Complete')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'closeProcurement.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${closeProcurementInstanceList}" status="i" var="closeProcurementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${closeProcurementInstance.id}">${fieldValue(bean: closeProcurementInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: closeProcurementInstance, field: "materialName")}</td>
					
						<td><g:formatDate date="${closeProcurementInstance.date}" /></td>
					
						<td><g:formatBoolean boolean="${closeProcurementInstance.complete}" /></td>
					
						<td>${fieldValue(bean: closeProcurementInstance, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${closeProcurementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
