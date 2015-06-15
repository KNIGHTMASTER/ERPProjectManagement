
<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostUse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementCostUse.label', default: 'ManagementCostUse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-managementCostUse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-managementCostUse" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list managementCostUse">
			
				<g:if test="${managementCostUseInstance?.managementCostActivity}">
				<li class="fieldcontain">
					<span id="managementCostActivity-label" class="property-label"><g:message code="managementCostUse.managementCostActivity.label" default="Management Cost Activity" /></span>
					
						<span class="property-value" aria-labelledby="managementCostActivity-label"><g:link controller="managementCostActivity" action="show" id="${managementCostUseInstance?.managementCostActivity?.id}">${managementCostUseInstance?.managementCostActivity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostUseInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="managementCostUse.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${managementCostUseInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostUseInstance?.usedDate}">
				<li class="fieldcontain">
					<span id="usedDate-label" class="property-label"><g:message code="managementCostUse.usedDate.label" default="Used Date" /></span>
					
						<span class="property-value" aria-labelledby="usedDate-label"><g:formatDate date="${managementCostUseInstance?.usedDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostUseInstance?.isUsed}">
				<li class="fieldcontain">
					<span id="isUsed-label" class="property-label"><g:message code="managementCostUse.isUsed.label" default="Is Used" /></span>
					
						<span class="property-value" aria-labelledby="isUsed-label"><g:formatBoolean boolean="${managementCostUseInstance?.isUsed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostUseInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="managementCostUse.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${managementCostUseInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementCostUseInstance?.managementCostPayment}">
				<li class="fieldcontain">
					<span id="managementCostPayment-label" class="property-label"><g:message code="managementCostUse.managementCostPayment.label" default="Management Cost Payment" /></span>
					
						<g:each in="${managementCostUseInstance.managementCostPayment}" var="m">
						<span class="property-value" aria-labelledby="managementCostPayment-label"><g:link controller="managementCostPayment" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managementCostUseInstance?.id}" />
					<g:link class="edit" action="edit" id="${managementCostUseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
