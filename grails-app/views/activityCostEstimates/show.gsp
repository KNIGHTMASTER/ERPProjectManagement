
<%@ page import="ProjectCostManagement.EstimateCost.ActivityCostEstimates" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityCostEstimates.label', default: 'ActivityCostEstimates')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityCostEstimates" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityCostEstimates" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityCostEstimates">
			
				<g:if test="${activityCostEstimatesInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="activityCostEstimates.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityCostEstimatesInstance?.activity?.id}">${activityCostEstimatesInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.resource}">
				<li class="fieldcontain">
					<span id="resource-label" class="property-label"><g:message code="activityCostEstimates.resource.label" default="Resource" /></span>
					
						<span class="property-value" aria-labelledby="resource-label"><g:fieldValue bean="${activityCostEstimatesInstance}" field="resource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.salary}">
				<li class="fieldcontain">
					<span id="salary-label" class="property-label"><g:message code="activityCostEstimates.salary.label" default="Salary" /></span>
					
						<span class="property-value" aria-labelledby="salary-label"><g:fieldValue bean="${activityCostEstimatesInstance}" field="salary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.labor}">
				<li class="fieldcontain">
					<span id="labor-label" class="property-label"><g:message code="activityCostEstimates.labor.label" default="Labor" /></span>
					
						<span class="property-value" aria-labelledby="labor-label"><g:fieldValue bean="${activityCostEstimatesInstance}" field="labor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.amountMaterial}">
				<li class="fieldcontain">
					<span id="amountMaterial-label" class="property-label"><g:message code="activityCostEstimates.amountMaterial.label" default="Amount Material" /></span>
					
						<span class="property-value" aria-labelledby="amountMaterial-label"><g:link controller="materialResource" action="show" id="${activityCostEstimatesInstance?.amountMaterial?.id}">${activityCostEstimatesInstance?.amountMaterial?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.priceMaterial}">
				<li class="fieldcontain">
					<span id="priceMaterial-label" class="property-label"><g:message code="activityCostEstimates.priceMaterial.label" default="Price Material" /></span>
					
						<span class="property-value" aria-labelledby="priceMaterial-label"><g:fieldValue bean="${activityCostEstimatesInstance}" field="priceMaterial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.managementCost}">
				<li class="fieldcontain">
					<span id="managementCost-label" class="property-label"><g:message code="activityCostEstimates.managementCost.label" default="Management Cost" /></span>
					
						<span class="property-value" aria-labelledby="managementCost-label"><g:fieldValue bean="${activityCostEstimatesInstance}" field="managementCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityCostEstimatesInstance?.confidenceLevel}">
				<li class="fieldcontain">
					<span id="confidenceLevel-label" class="property-label"><g:message code="activityCostEstimates.confidenceLevel.label" default="Confidence Level" /></span>
					
						<span class="property-value" aria-labelledby="confidenceLevel-label"><g:fieldValue bean="${activityCostEstimatesInstance}" field="confidenceLevel"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityCostEstimatesInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityCostEstimatesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
