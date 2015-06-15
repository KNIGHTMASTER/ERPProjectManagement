
<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostPayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCostPayment.label', default: 'MaterialCostPayment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materialCostPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materialCostPayment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="paymentDate" title="${message(code: 'materialCostPayment.paymentDate.label', default: 'Payment Date')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'materialCostPayment.amount.label', default: 'Amount')}" />
					
                                                <th>Price</th>
                                                <th>Total Price</th>
						<g:sortableColumn property="isPayed" title="${message(code: 'materialCostPayment.isPayed.label', default: 'Is Payed')}" />
					
						<th><g:message code="materialCostPayment.materialCostUse.label" default="Material Cost" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materialCostPaymentInstanceList}" status="i" var="materialCostPaymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialCostPaymentInstance.id}">${fieldValue(bean: materialCostPaymentInstance, field: "paymentDate")}</g:link></td>
					
						<td>${fieldValue(bean: materialCostPaymentInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: materialCostPaymentInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: materialCostPaymentInstance, field: "total")}</td>
					
						<td><g:formatBoolean boolean="${materialCostPaymentInstance.isPayed}" /></td>
					
						<td>${fieldValue(bean: materialCostPaymentInstance, field: "materialCost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materialCostPaymentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
