<%@ page import="ProjectCostManagement.ControlCost.ManagementForecasting" %>



<div class="fieldcontain ${hasErrors(bean: managementForecastingInstance, field: 'periode', 'error')} required">
	<label for="periode">
		<g:message code="managementForecasting.periode.label" default="Periode" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periode" type="number" value="${managementForecastingInstance.periode}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementForecastingInstance, field: 'estimateCost', 'error')} required">
	<label for="estimateCost">
		<g:message code="managementForecasting.estimateCost.label" default="Estimate Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimateCost" value="${fieldValue(bean: managementForecastingInstance, field: 'estimateCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementForecastingInstance, field: 'trendValue', 'error')} required">
	<label for="trendValue">
		<g:message code="managementForecasting.trendValue.label" default="Trend Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="trendValue" value="${fieldValue(bean: managementForecastingInstance, field: 'trendValue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementForecastingInstance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="managementForecasting.budget.label" default="Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="budget" name="budget.id" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" optionKey="id" required="" value="${managementForecastingInstance?.budget?.id}" class="many-to-one"/>
</div>

