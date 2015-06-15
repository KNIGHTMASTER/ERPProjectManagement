
<%@ page import="ProjectProcurementManagement.PlanProcurement.RequirementProcurement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementProcurement.label', default: 'RequirementProcurement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirementProcurement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requirementProcurement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirementProcurement">
			
				<g:if test="${requirementProcurementInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="requirementProcurement.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${requirementProcurementInstance?.projectName?.id}">${requirementProcurementInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="requirementProcurement.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${requirementProcurementInstance?.activity?.id}">${requirementProcurementInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.materialName}">
				<li class="fieldcontain">
					<span id="materialName-label" class="property-label"><g:message code="requirementProcurement.materialName.label" default="Material Name" /></span>
					
						<span class="property-value" aria-labelledby="materialName-label"><g:link controller="material" action="show" id="${requirementProcurementInstance?.materialName?.id}">${requirementProcurementInstance?.materialName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="requirementProcurement.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${requirementProcurementInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="requirementProcurement.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${requirementProcurementInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="requirementProcurement.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${requirementProcurementInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.priceReference}">
				<li class="fieldcontain">
					<span id="priceReference-label" class="property-label"><g:message code="requirementProcurement.priceReference.label" default="Price Reference" /></span>
					
						<span class="property-value" aria-labelledby="priceReference-label"><g:fieldValue bean="${requirementProcurementInstance}" field="priceReference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementProcurementInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="requirementProcurement.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${requirementProcurementInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementProcurementInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementProcurementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
