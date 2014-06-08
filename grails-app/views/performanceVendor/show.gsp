
<%@ page import="ProjectProcurementManagement.AdministerProcurements.PerformanceVendor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'performanceVendor.label', default: 'PerformanceVendor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-performanceVendor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-performanceVendor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list performanceVendor">
			
				<g:if test="${performanceVendorInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="performanceVendor.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${performanceVendorInstance?.projectName?.id}">${performanceVendorInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="performanceVendor.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:fieldValue bean="${performanceVendorInstance}" field="vendorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.productQuality}">
				<li class="fieldcontain">
					<span id="productQuality-label" class="property-label"><g:message code="performanceVendor.productQuality.label" default="Product Quality" /></span>
					
						<span class="property-value" aria-labelledby="productQuality-label"><g:fieldValue bean="${performanceVendorInstance}" field="productQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.onTimeDelivery}">
				<li class="fieldcontain">
					<span id="onTimeDelivery-label" class="property-label"><g:message code="performanceVendor.onTimeDelivery.label" default="On Time Delivery" /></span>
					
						<span class="property-value" aria-labelledby="onTimeDelivery-label"><g:fieldValue bean="${performanceVendorInstance}" field="onTimeDelivery"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.documentationQuality}">
				<li class="fieldcontain">
					<span id="documentationQuality-label" class="property-label"><g:message code="performanceVendor.documentationQuality.label" default="Documentation Quality" /></span>
					
						<span class="property-value" aria-labelledby="documentationQuality-label"><g:fieldValue bean="${performanceVendorInstance}" field="documentationQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.developmentCost}">
				<li class="fieldcontain">
					<span id="developmentCost-label" class="property-label"><g:message code="performanceVendor.developmentCost.label" default="Development Cost" /></span>
					
						<span class="property-value" aria-labelledby="developmentCost-label"><g:fieldValue bean="${performanceVendorInstance}" field="developmentCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.developmentTime}">
				<li class="fieldcontain">
					<span id="developmentTime-label" class="property-label"><g:message code="performanceVendor.developmentTime.label" default="Development Time" /></span>
					
						<span class="property-value" aria-labelledby="developmentTime-label"><g:fieldValue bean="${performanceVendorInstance}" field="developmentTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.costPerUnit}">
				<li class="fieldcontain">
					<span id="costPerUnit-label" class="property-label"><g:message code="performanceVendor.costPerUnit.label" default="Cost Per Unit" /></span>
					
						<span class="property-value" aria-labelledby="costPerUnit-label"><g:fieldValue bean="${performanceVendorInstance}" field="costPerUnit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.transactionalEfficiency}">
				<li class="fieldcontain">
					<span id="transactionalEfficiency-label" class="property-label"><g:message code="performanceVendor.transactionalEfficiency.label" default="Transactional Efficiency" /></span>
					
						<span class="property-value" aria-labelledby="transactionalEfficiency-label"><g:fieldValue bean="${performanceVendorInstance}" field="transactionalEfficiency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${performanceVendorInstance?.quality}">
				<li class="fieldcontain">
					<span id="quality-label" class="property-label"><g:message code="performanceVendor.quality.label" default="Quality" /></span>
					
						<span class="property-value" aria-labelledby="quality-label"><g:fieldValue bean="${performanceVendorInstance}" field="quality"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${performanceVendorInstance?.id}" />
					<g:link class="edit" action="edit" id="${performanceVendorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
