<%@ page import="ProjectCostManagement.EstimateCost.BasicOfEstimate" %>



<div class="fieldcontain ${hasErrors(bean: basicOfEstimateInstance, field: 'idMilestone', 'error')} required">
	<label for="idMilestone">
		<g:message code="basicOfEstimate.idMilestone.label" default="Id Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idMilestone" name="idMilestone.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" optionKey="id" required="" value="${basicOfEstimateInstance?.idMilestone?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicOfEstimateInstance, field: 'pessimistic', 'error')} required">
	<label for="pessimistic">
		<g:message code="basicOfEstimate.pessimistic.label" default="Pessimistic" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pessimistic" value="${fieldValue(bean: basicOfEstimateInstance, field: 'pessimistic')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicOfEstimateInstance, field: 'optimistic', 'error')} required">
	<label for="optimistic">
		<g:message code="basicOfEstimate.optimistic.label" default="Optimistic" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="optimistic" value="${fieldValue(bean: basicOfEstimateInstance, field: 'optimistic')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: basicOfEstimateInstance, field: 'mostLikelyEstimate', 'error')} required">
	<label for="mostLikelyEstimate">
		<g:message code="basicOfEstimate.mostLikelyEstimate.label" default="Most Likely Estimate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mostLikelyEstimate" value="${fieldValue(bean: basicOfEstimateInstance, field: 'mostLikelyEstimate')}" required=""/>
</div>