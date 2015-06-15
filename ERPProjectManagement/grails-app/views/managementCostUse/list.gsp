
<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostUse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementCostUse.label', default: 'ManagementCostUse')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-managementCostUse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-managementCostUse" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="managementCostUse.managementCostActivity.label" default="Management Cost Activity" /></th>
					
						<g:sortableColumn property="price" title="${message(code: 'managementCostUse.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="usedDate" title="${message(code: 'managementCostUse.usedDate.label', default: 'Used Date')}" />
					
						<g:sortableColumn property="isUsed" title="${message(code: 'managementCostUse.isUsed.label', default: 'Is Used')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'managementCostUse.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${managementCostUseInstanceList}" status="i" var="managementCostUseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managementCostUseInstance.id}">${fieldValue(bean: managementCostUseInstance, field: "managementCostActivity")}</g:link></td>
					
						<td>${fieldValue(bean: managementCostUseInstance, field: "price")}</td>
					
						<td><g:formatDate date="${managementCostUseInstance.usedDate}" /></td>
					
						<td><g:formatBoolean boolean="${managementCostUseInstance.isUsed}" /></td>
					
						<td>${fieldValue(bean: managementCostUseInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${managementCostUseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
