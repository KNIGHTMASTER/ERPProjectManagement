<%@ page import="ProjectCostManagement.EstimateCost.ActivityCostEstimates" %>



<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityCostEstimates.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${activityCostEstimatesInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="activityCostEstimates.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="resource" from="${activityCostEstimatesInstance.constraints.resource.inList}" required="" value="${activityCostEstimatesInstance?.resource}" valueMessagePrefix="activityCostEstimates.resource"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'salary', 'error')} required">
	<label for="salary">
		<g:message code="activityCostEstimates.salary.label" default="Salary" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="salary" value="${fieldValue(bean: activityCostEstimatesInstance, field: 'salary')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'labor', 'error')} required">
	<label for="labor">
		<g:message code="activityCostEstimates.labor.label" default="Labor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="labor" type="number" value="${activityCostEstimatesInstance.labor}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'amountMaterial', 'error')} required">
	<label for="amountMaterial">
		<g:message code="activityCostEstimates.amountMaterial.label" default="Amount Material" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="amountMaterial" name="amountMaterial.id" from="${ProjectProcurementManagement.AdministerProcurements.MaterialResource.list()}" optionKey="id" required="" value="${activityCostEstimatesInstance?.amountMaterial?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'priceMaterial', 'error')} required">
	<label for="priceMaterial">
		<g:message code="activityCostEstimates.priceMaterial.label" default="Price Material" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priceMaterial" value="${fieldValue(bean: activityCostEstimatesInstance, field: 'priceMaterial')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'managementCost', 'error')} required">
	<label for="managementCost">
		<g:message code="activityCostEstimates.managementCost.label" default="Management Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="managementCost" value="${fieldValue(bean: activityCostEstimatesInstance, field: 'managementCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostEstimatesInstance, field: 'confidenceLevel', 'error')} required">
	<label for="confidenceLevel">
		<g:message code="activityCostEstimates.confidenceLevel.label" default="Confidence Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="confidenceLevel" from="${activityCostEstimatesInstance.constraints.confidenceLevel.inList}" required="" value="${fieldValue(bean: activityCostEstimatesInstance, field: 'confidenceLevel')}" valueMessagePrefix="activityCostEstimates.confidenceLevel"/>
</div>

