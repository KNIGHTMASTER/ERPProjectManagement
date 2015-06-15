<%@ page import="ProjectCostManagement.ControlCost.EstimateToComplete" %>



<div class="fieldcontain ${hasErrors(bean: estimateToCompleteInstance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="estimateToComplete.budget.label" default="Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="budget" name="budget.id" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" optionKey="id" required="" value="${estimateToCompleteInstance?.budget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estimateToCompleteInstance, field: 'periode', 'error')} required">
	<label for="periode">
		<g:message code="estimateToComplete.periode.label" default="Periode" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periode" type="number" value="${estimateToCompleteInstance.periode}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: estimateToCompleteInstance, field: 'estimateCost', 'error')} required">
	<label for="estimateCost">
		<g:message code="estimateToComplete.estimateCost.label" default="Estimate Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimateCost" value="${fieldValue(bean: estimateToCompleteInstance, field: 'estimateCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: estimateToCompleteInstance, field: 'trendValue', 'error')} required">
	<label for="trendValue">
		<g:message code="estimateToComplete.trendValue.label" default="Trend Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="trendValue" value="${fieldValue(bean: estimateToCompleteInstance, field: 'trendValue')}" required=""/>
</div>

