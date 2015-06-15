
<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostPayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCostPayment.label', default: 'MaterialCostPayment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materialCostPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materialCostPayment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materialCostPayment">
			
				<g:if test="${materialCostPaymentInstance?.paymentDate}">
				<li class="fieldcontain">
					<span id="paymentDate-label" class="property-label"><g:message code="materialCostPayment.paymentDate.label" default="Payment Date" /></span>
					
						<span class="property-value" aria-labelledby="paymentDate-label"><g:formatDate date="${materialCostPaymentInstance?.paymentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostPaymentInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="materialCostPayment.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${materialCostPaymentInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostPaymentInstance?.isPayed}">
				<li class="fieldcontain">
					<span id="isPayed-label" class="property-label"><g:message code="materialCostPayment.isPayed.label" default="Is Payed" /></span>
					
						<span class="property-value" aria-labelledby="isPayed-label"><g:formatBoolean boolean="${materialCostPaymentInstance?.isPayed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostPaymentInstance?.materialCost}">
				<li class="fieldcontain">
					<span id="materialCost-label" class="property-label"><g:message code="materialCostPayment.materialCost.label" default="Material Cost" /></span>
					
						<span class="property-value" aria-labelledby="materialCost-label"><g:link controller="materialCostActivity" action="show" id="${materialCostPaymentInstance?.materialCost?.id}">${materialCostPaymentInstance?.materialCost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materialCostPaymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${materialCostPaymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
