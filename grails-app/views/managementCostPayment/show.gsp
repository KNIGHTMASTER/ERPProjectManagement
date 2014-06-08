
<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostPayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementCostPayment.label', default: 'ManagementCostPayment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-managementCostPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-managementCostPayment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list managementCostPayment">
			
				<g:if test="${managementCostPaymentInstance?.paymentDate}">
				<li class="fieldcontain">
					<span id="paymentDate-label" class="property-label"><g:message code="managementCostPayment.paymentDate.label" default="Payment Date" /></span>
					
						<span class="property-value" aria-labelledby="paymentDate-label"><g:formatDate date="${managementCostPaymentInstance?.paymentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostPaymentInstance?.managementCostUse}">
				<li class="fieldcontain">
					<span id="managementCostUse-label" class="property-label"><g:message code="managementCostPayment.managementCostUse.label" default="Management Cost Use" /></span>
					
						<span class="property-value" aria-labelledby="managementCostUse-label"><g:link controller="managementCostUse" action="show" id="${managementCostPaymentInstance?.managementCostUse?.id}">${managementCostPaymentInstance?.managementCostUse?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostPaymentInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="managementCostPayment.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${managementCostPaymentInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostPaymentInstance?.isPayed}">
				<li class="fieldcontain">
					<span id="isPayed-label" class="property-label"><g:message code="managementCostPayment.isPayed.label" default="Is Payed" /></span>
					
						<span class="property-value" aria-labelledby="isPayed-label"><g:formatBoolean boolean="${managementCostPaymentInstance?.isPayed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostPaymentInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="managementCostPayment.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${managementCostPaymentInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managementCostPaymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${managementCostPaymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
