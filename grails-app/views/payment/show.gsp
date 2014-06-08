
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-payment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-payment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list payment">
			
				<g:if test="${paymentInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="payment.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${paymentInstance?.projectName?.id}">${paymentInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentMethod}">
				<li class="fieldcontain">
					<span id="paymentMethod-label" class="property-label"><g:message code="payment.paymentMethod.label" default="Payment Method" /></span>
					
						<span class="property-value" aria-labelledby="paymentMethod-label"><g:fieldValue bean="${paymentInstance}" field="paymentMethod"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentAcceptanceCriteria}">
				<li class="fieldcontain">
					<span id="paymentAcceptanceCriteria-label" class="property-label"><g:message code="payment.paymentAcceptanceCriteria.label" default="Payment Acceptance Criteria" /></span>
					
						<g:each in="${paymentInstance.paymentAcceptanceCriteria}" var="p">
						<span class="property-value" aria-labelledby="paymentAcceptanceCriteria-label"><g:link controller="paymentAcceptanceCriteria" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${paymentInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="payment.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${paymentInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paymentInstance?.id}" />
					<g:link class="edit" action="edit" id="${paymentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
