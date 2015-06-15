
<%@ page import="ProjectProcurementManagement.ConductProcurements.ProcurementHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'procurementHistory.label', default: 'ProcurementHistory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-procurementHistory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-procurementHistory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list procurementHistory">
			
				<g:if test="${procurementHistoryInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="procurementHistory.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${procurementHistoryInstance?.projectName?.id}">${procurementHistoryInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="procurementHistory.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:fieldValue bean="${procurementHistoryInstance}" field="vendorName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.productQuality}">
				<li class="fieldcontain">
					<span id="productQuality-label" class="property-label"><g:message code="procurementHistory.productQuality.label" default="Product Quality" /></span>
					
						<span class="property-value" aria-labelledby="productQuality-label"><g:fieldValue bean="${procurementHistoryInstance}" field="productQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.onTimeDelivery}">
				<li class="fieldcontain">
					<span id="onTimeDelivery-label" class="property-label"><g:message code="procurementHistory.onTimeDelivery.label" default="On Time Delivery" /></span>
					
						<span class="property-value" aria-labelledby="onTimeDelivery-label"><g:fieldValue bean="${procurementHistoryInstance}" field="onTimeDelivery"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.documentationQuality}">
				<li class="fieldcontain">
					<span id="documentationQuality-label" class="property-label"><g:message code="procurementHistory.documentationQuality.label" default="Documentation Quality" /></span>
					
						<span class="property-value" aria-labelledby="documentationQuality-label"><g:fieldValue bean="${procurementHistoryInstance}" field="documentationQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.developmentCost}">
				<li class="fieldcontain">
					<span id="developmentCost-label" class="property-label"><g:message code="procurementHistory.developmentCost.label" default="Development Cost" /></span>
					
						<span class="property-value" aria-labelledby="developmentCost-label"><g:fieldValue bean="${procurementHistoryInstance}" field="developmentCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.developmentTime}">
				<li class="fieldcontain">
					<span id="developmentTime-label" class="property-label"><g:message code="procurementHistory.developmentTime.label" default="Development Time" /></span>
					
						<span class="property-value" aria-labelledby="developmentTime-label"><g:fieldValue bean="${procurementHistoryInstance}" field="developmentTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.costPerUnit}">
				<li class="fieldcontain">
					<span id="costPerUnit-label" class="property-label"><g:message code="procurementHistory.costPerUnit.label" default="Cost Per Unit" /></span>
					
						<span class="property-value" aria-labelledby="costPerUnit-label"><g:fieldValue bean="${procurementHistoryInstance}" field="costPerUnit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.transactionalEfficiency}">
				<li class="fieldcontain">
					<span id="transactionalEfficiency-label" class="property-label"><g:message code="procurementHistory.transactionalEfficiency.label" default="Transactional Efficiency" /></span>
					
						<span class="property-value" aria-labelledby="transactionalEfficiency-label"><g:fieldValue bean="${procurementHistoryInstance}" field="transactionalEfficiency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementHistoryInstance?.quality}">
				<li class="fieldcontain">
					<span id="quality-label" class="property-label"><g:message code="procurementHistory.quality.label" default="Quality" /></span>
					
						<span class="property-value" aria-labelledby="quality-label"><g:fieldValue bean="${procurementHistoryInstance}" field="quality"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${procurementHistoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${procurementHistoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
