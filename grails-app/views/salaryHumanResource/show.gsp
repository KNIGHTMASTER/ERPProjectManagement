
<%@ page import="ProjectCostManagement.DetermineBudget.SalaryHumanResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salaryHumanResource.label', default: 'SalaryHumanResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-salaryHumanResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-salaryHumanResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list salaryHumanResource">
			
				<g:if test="${salaryHumanResourceInstance?.humanResourceCost}">
				<li class="fieldcontain">
					<span id="humanResourceCost-label" class="property-label"><g:message code="salaryHumanResource.humanResourceCost.label" default="Human Resource Cost" /></span>
					
						<span class="property-value" aria-labelledby="humanResourceCost-label"><g:link controller="humanResourceCost" action="show" id="${salaryHumanResourceInstance?.humanResourceCost?.id}">${salaryHumanResourceInstance?.humanResourceCost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${salaryHumanResourceInstance?.paymentDate}">
				<li class="fieldcontain">
					<span id="paymentDate-label" class="property-label"><g:message code="salaryHumanResource.paymentDate.label" default="Payment Date" /></span>
					
						<span class="property-value" aria-labelledby="paymentDate-label"><g:formatDate date="${salaryHumanResourceInstance?.paymentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${salaryHumanResourceInstance?.isPayed}">
				<li class="fieldcontain">
					<span id="isPayed-label" class="property-label"><g:message code="salaryHumanResource.isPayed.label" default="Is Payed" /></span>
					
						<span class="property-value" aria-labelledby="isPayed-label"><g:formatBoolean boolean="${salaryHumanResourceInstance?.isPayed}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${salaryHumanResourceInstance?.id}" />
					<g:link class="edit" action="edit" id="${salaryHumanResourceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
