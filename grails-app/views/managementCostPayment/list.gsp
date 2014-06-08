
<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostPayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementCostPayment.label', default: 'ManagementCostPayment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-managementCostPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-managementCostPayment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="paymentDate" title="${message(code: 'managementCostPayment.paymentDate.label', default: 'Payment Date')}" />
					
						<th><g:message code="managementCostPayment.managementCostUse.label" default="Management Cost Use" /></th>
					
						<g:sortableColumn property="price" title="${message(code: 'managementCostPayment.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="isPayed" title="${message(code: 'managementCostPayment.isPayed.label', default: 'Is Payed')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'managementCostPayment.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${managementCostPaymentInstanceList}" status="i" var="managementCostPaymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${managementCostPaymentInstance.id}">${fieldValue(bean: managementCostPaymentInstance, field: "paymentDate")}</g:link></td>
					
						<td>${fieldValue(bean: managementCostPaymentInstance, field: "managementCostUse")}</td>
					
						<td>${fieldValue(bean: managementCostPaymentInstance, field: "price")}</td>
					
						<td><g:formatBoolean boolean="${managementCostPaymentInstance.isPayed}" /></td>
					
						<td>${fieldValue(bean: managementCostPaymentInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${managementCostPaymentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
