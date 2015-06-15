<%@ page import="ProjectCostManagement.ControlCost.HumanForecasting" %>

<div class="fieldcontain ${hasErrors(bean: humanForecastingInstance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="humanForecasting.budget.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="budget" name="budget.id" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" optionKey="id" required="" value="${humanForecastingInstance?.budget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: humanForecastingInstance, field: 'periode', 'error')} required">
	<label for="periode">
		<g:message code="humanForecasting.periode.label" default="Periode" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="periode" type="number" value="${humanForecastingInstance.periode}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: humanForecastingInstance, field: 'estimateCost', 'error')} required">
	<label for="estimateCost">
		<g:message code="humanForecasting.estimateCost.label" default="Estimate Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimateCost" value="${fieldValue(bean: humanForecastingInstance, field: 'estimateCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: humanForecastingInstance, field: 'trendValue', 'error')} required">
	<label for="trendValue">
		<g:message code="humanForecasting.trendValue.label" default="Trend Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="trendValue" value="${fieldValue(bean: humanForecastingInstance, field: 'trendValue')}" required=""/>
</div>