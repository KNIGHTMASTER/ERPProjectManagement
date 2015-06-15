
<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostUse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCostUse.label', default: 'MaterialCostUse')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materialCostUse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materialCostUse" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="usedDate" title="${message(code: 'materialCostUse.usedDate.label', default: 'Used Date')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'materialCostUse.amount.label', default: 'Amount')}" />
					
                                                <th>Price</th>
                                                <th>Total Price</th>
						<g:sortableColumn property="isUsed" title="${message(code: 'materialCostUse.isUsed.label', default: 'Is Used')}" />
					
						<th><g:message code="materialCostUse.materialCostActivity.label" default="Material Cost Activity" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materialCostUseInstanceList}" status="i" var="materialCostUseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialCostUseInstance.id}">${fieldValue(bean: materialCostUseInstance, field: "usedDate")}</g:link></td>
					
						<td>${fieldValue(bean: materialCostUseInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: materialCostUseInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: materialCostUseInstance, field: "total")}</td>
					
						<td><g:formatBoolean boolean="${materialCostUseInstance.isUsed}" /></td>
					
						<td>${fieldValue(bean: materialCostUseInstance, field: "materialCostActivity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materialCostUseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
