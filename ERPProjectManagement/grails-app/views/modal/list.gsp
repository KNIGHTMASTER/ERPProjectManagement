
<%@ page import="ProjectCostManagement.DetermineBudget.Modal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modal.label', default: 'Modal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-modal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-modal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="modal.projectName.label" default="Project Name" /></th>
					
						<g:sortableColumn property="value" title="${message(code: 'modal.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="source" title="${message(code: 'modal.source.label', default: 'Source')}" />
					
						<g:sortableColumn property="datePayment" title="${message(code: 'modal.datePayment.label', default: 'Date Payment')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'modal.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${modalInstanceList}" status="i" var="modalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${modalInstance.id}">${fieldValue(bean: modalInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: modalInstance, field: "value")}</td>
					
						<td>${fieldValue(bean: modalInstance, field: "source")}</td>
					
						<td><g:formatDate date="${modalInstance.datePayment}" /></td>
					
						<td>${fieldValue(bean: modalInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${modalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
