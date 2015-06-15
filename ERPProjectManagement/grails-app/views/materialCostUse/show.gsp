
<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostUse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialCostUse.label', default: 'MaterialCostUse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materialCostUse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materialCostUse" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materialCostUse">
			
				<g:if test="${materialCostUseInstance?.usedDate}">
				<li class="fieldcontain">
					<span id="usedDate-label" class="property-label"><g:message code="materialCostUse.usedDate.label" default="Used Date" /></span>
					
						<span class="property-value" aria-labelledby="usedDate-label"><g:formatDate date="${materialCostUseInstance?.usedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostUseInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="materialCostUse.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${materialCostUseInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostUseInstance?.isUsed}">
				<li class="fieldcontain">
					<span id="isUsed-label" class="property-label"><g:message code="materialCostUse.isUsed.label" default="Is Used" /></span>
					
						<span class="property-value" aria-labelledby="isUsed-label"><g:formatBoolean boolean="${materialCostUseInstance?.isUsed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostUseInstance?.materialCostActivity}">
				<li class="fieldcontain">
					<span id="materialCostActivity-label" class="property-label"><g:message code="materialCostUse.materialCostActivity.label" default="Material Cost Activity" /></span>
					
						<span class="property-value" aria-labelledby="materialCostActivity-label"><g:link controller="materialCostActivity" action="show" id="${materialCostUseInstance?.materialCostActivity?.id}">${materialCostUseInstance?.materialCostActivity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialCostUseInstance?.materialCostPayment}">
				<li class="fieldcontain">
					<span id="materialCostPayment-label" class="property-label"><g:message code="materialCostUse.materialCostPayment.label" default="Material Cost Payment" /></span>
					
						<g:each in="${materialCostUseInstance.materialCostPayment}" var="m">
						<span class="property-value" aria-labelledby="materialCostPayment-label"><g:link controller="materialCostPayment" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materialCostUseInstance?.id}" />
					<g:link class="edit" action="edit" id="${materialCostUseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
