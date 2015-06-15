<%@ page import="ProjectCostManagement.ControlCost.EstimateComplete" %>



<div class="fieldcontain ${hasErrors(bean: estimateCompleteInstance, field: 'periode', 'error')} required">
	<label for="periode">
		<g:message code="estimateComplete.periode.label" default="Periode" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periode" type="number" value="${estimateCompleteInstance.periode}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: estimateCompleteInstance, field: 'actualCost', 'error')} required">
	<label for="actualCost">
		<g:message code="estimateComplete.actualCost.label" default="Actual Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="actualCost" value="${fieldValue(bean: estimateCompleteInstance, field: 'actualCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: estimateCompleteInstance, field: 'estimateCost', 'error')} required">
	<label for="estimateCost">
		<g:message code="estimateComplete.estimateCost.label" default="Estimate Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimateCost" value="${fieldValue(bean: estimateCompleteInstance, field: 'estimateCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: estimateCompleteInstance, field: 'trendValue', 'error')} required">
	<label for="trendValue">
		<g:message code="estimateComplete.trendValue.label" default="Trend Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="trendValue" value="${fieldValue(bean: estimateCompleteInstance, field: 'trendValue')}" required=""/>
</div>

