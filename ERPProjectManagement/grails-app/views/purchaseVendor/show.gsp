
<%@ page import="ProjectProcurementManagement.AdministerProcurements.PurchaseVendor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'purchaseVendor.label', default: 'PurchaseVendor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-purchaseVendor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-purchaseVendor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list purchaseVendor">
			
				<g:if test="${purchaseVendorInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="purchaseVendor.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${purchaseVendorInstance?.projectName?.id}">${purchaseVendorInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseVendorInstance?.material}">
				<li class="fieldcontain">
					<span id="material-label" class="property-label"><g:message code="purchaseVendor.material.label" default="Material" /></span>
					
						<span class="property-value" aria-labelledby="material-label"><g:link controller="materialResource" action="show" id="${purchaseVendorInstance?.material?.id}">${purchaseVendorInstance?.material?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseVendorInstance?.purchaseDate}">
				<li class="fieldcontain">
					<span id="purchaseDate-label" class="property-label"><g:message code="purchaseVendor.purchaseDate.label" default="Purchase Date" /></span>
					
						<span class="property-value" aria-labelledby="purchaseDate-label"><g:formatDate date="${purchaseVendorInstance?.purchaseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${purchaseVendorInstance?.pricePerUnit}">
				<li class="fieldcontain">
					<span id="pricePerUnit-label" class="property-label"><g:message code="purchaseVendor.pricePerUnit.label" default="Price Per Unit" /></span>
					
						<span class="property-value" aria-labelledby="pricePerUnit-label"><g:fieldValue bean="${purchaseVendorInstance}" field="pricePerUnit"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${purchaseVendorInstance?.id}" />
					<g:link class="edit" action="edit" id="${purchaseVendorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
