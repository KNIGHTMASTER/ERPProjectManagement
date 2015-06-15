<%@ page import="ProjectCostManagement.ControlCost.AnalysisEVM" %>



<div class="fieldcontain ${hasErrors(bean: analysisEVMInstance, field: 'idMilestone', 'error')} required">
	<label for="idMilestone">
		<g:message code="analysisEVM.idMilestone.label" default="Id Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idMilestone" name="idMilestone.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" optionKey="id" required="" value="${analysisEVMInstance?.idMilestone?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisEVMInstance, field: 'plannedValue', 'error')} required">
	<label for="plannedValue">
		<g:message code="analysisEVM.plannedValue.label" default="Planned Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="plannedValue" value="${fieldValue(bean: analysisEVMInstance, field: 'plannedValue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisEVMInstance, field: 'earnedValue', 'error')} required">
	<label for="earnedValue">
		<g:message code="analysisEVM.earnedValue.label" default="Earned Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="earnedValue" value="${fieldValue(bean: analysisEVMInstance, field: 'earnedValue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisEVMInstance, field: 'actualCost', 'error')} required">
	<label for="actualCost">
		<g:message code="analysisEVM.actualCost.label" default="Actual Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="actualCost" value="${fieldValue(bean: analysisEVMInstance, field: 'actualCost')}" required=""/>
</div>

