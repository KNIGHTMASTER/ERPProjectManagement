<%@ page import="ProjectCostManagement.ControlCost.MaterialForecasting" %>



<div class="fieldcontain ${hasErrors(bean: materialForecastingInstance, field: 'periode', 'error')} required">
	<label for="periode">
		<g:message code="materialForecasting.periode.label" default="Periode" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periode" type="number" value="${materialForecastingInstance.periode}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialForecastingInstance, field: 'estimateCost', 'error')} required">
	<label for="estimateCost">
		<g:message code="materialForecasting.estimateCost.label" default="Estimate Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimateCost" value="${fieldValue(bean: materialForecastingInstance, field: 'estimateCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialForecastingInstance, field: 'trendValue', 'error')} required">
	<label for="trendValue">
		<g:message code="materialForecasting.trendValue.label" default="Trend Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="trendValue" value="${fieldValue(bean: materialForecastingInstance, field: 'trendValue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialForecastingInstance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="materialForecasting.budget.label" default="Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="budget" name="budget.id" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" optionKey="id" required="" value="${materialForecastingInstance?.budget?.id}" class="many-to-one"/>
</div>

