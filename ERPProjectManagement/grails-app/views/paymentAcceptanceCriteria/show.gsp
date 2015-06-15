
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PaymentAcceptanceCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-paymentAcceptanceCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-paymentAcceptanceCriteria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list paymentAcceptanceCriteria">
			
				<g:if test="${paymentAcceptanceCriteriaInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="paymentAcceptanceCriteria.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${paymentAcceptanceCriteriaInstance?.projectName?.id}">${paymentAcceptanceCriteriaInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentAcceptanceCriteriaInstance?.payment}">
				<li class="fieldcontain">
					<span id="payment-label" class="property-label"><g:message code="paymentAcceptanceCriteria.payment.label" default="Payment" /></span>
					
						<span class="property-value" aria-labelledby="payment-label"><g:link controller="payment" action="show" id="${paymentAcceptanceCriteriaInstance?.payment?.id}">${paymentAcceptanceCriteriaInstance?.payment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentAcceptanceCriteriaInstance?.acceptanceCriteria}">
				<li class="fieldcontain">
					<span id="acceptanceCriteria-label" class="property-label"><g:message code="paymentAcceptanceCriteria.acceptanceCriteria.label" default="Acceptance Criteria" /></span>
					
						<span class="property-value" aria-labelledby="acceptanceCriteria-label"><g:fieldValue bean="${paymentAcceptanceCriteriaInstance}" field="acceptanceCriteria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paymentAcceptanceCriteriaInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="paymentAcceptanceCriteria.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${paymentAcceptanceCriteriaInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paymentAcceptanceCriteriaInstance?.id}" />
					<g:link class="edit" action="edit" id="${paymentAcceptanceCriteriaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
