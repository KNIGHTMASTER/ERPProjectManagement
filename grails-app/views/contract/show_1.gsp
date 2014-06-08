
<%@ page import="ProjectProcurementManagement.AdministerProcurements.Contract" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contract" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contract">
			
				<g:if test="${contractInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="contract.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:link controller="vendorRegister" action="show" id="${contractInstance?.vendorName?.id}">${contractInstance?.vendorName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.noContract}">
				<li class="fieldcontain">
					<span id="noContract-label" class="property-label"><g:message code="contract.noContract.label" default="No Contract" /></span>
					
						<span class="property-value" aria-labelledby="noContract-label"><g:fieldValue bean="${contractInstance}" field="noContract"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.materialName}">
				<li class="fieldcontain">
					<span id="materialName-label" class="property-label"><g:message code="contract.materialName.label" default="Material Name" /></span>
					
						<span class="property-value" aria-labelledby="materialName-label"><g:link controller="approval" action="show" id="${contractInstance?.materialName?.id}">${contractInstance?.materialName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="contract.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${contractInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.contractDate}">
				<li class="fieldcontain">
					<span id="contractDate-label" class="property-label"><g:message code="contract.contractDate.label" default="Contract Date" /></span>
					
						<span class="property-value" aria-labelledby="contractDate-label"><g:formatDate date="${contractInstance?.contractDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.startWork}">
				<li class="fieldcontain">
					<span id="startWork-label" class="property-label"><g:message code="contract.startWork.label" default="Start Work" /></span>
					
						<span class="property-value" aria-labelledby="startWork-label"><g:formatDate date="${contractInstance?.startWork}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.endWork}">
				<li class="fieldcontain">
					<span id="endWork-label" class="property-label"><g:message code="contract.endWork.label" default="End Work" /></span>
					
						<span class="property-value" aria-labelledby="endWork-label"><g:formatDate date="${contractInstance?.endWork}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.acceptance}">
				<li class="fieldcontain">
					<span id="acceptance-label" class="property-label"><g:message code="contract.acceptance.label" default="Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="acceptance-label"><g:formatBoolean boolean="${contractInstance?.acceptance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractInstance?.complete}">
				<li class="fieldcontain">
					<span id="complete-label" class="property-label"><g:message code="contract.complete.label" default="Complete" /></span>
					
						<span class="property-value" aria-labelledby="complete-label"><g:formatBoolean boolean="${contractInstance?.complete}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contractInstance?.id}" />
					<g:link class="edit" action="edit" id="${contractInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
