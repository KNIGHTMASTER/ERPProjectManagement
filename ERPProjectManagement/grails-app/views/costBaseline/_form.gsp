<%@ page import="ProjectCostManagement.DetermineBudget.CostBaseline" %>



<div class="fieldcontain ${hasErrors(bean: costBaselineInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="costBaseline.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="balance" name="balance.id" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" optionKey="id" required="" value="${costBaselineInstance?.balance?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBaselineInstance, field: 'baseline', 'error')} ">
	<label for="baseline">
		<g:message code="costBaseline.baseline.label" default="Baseline" />
		
	</label>
	<g:textField name="baseline" value="${costBaselineInstance?.baseline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBaselineInstance, field: 'developProjectManagementPlan', 'error')} ">
	<label for="developProjectManagementPlan">
		<g:message code="costBaseline.developProjectManagementPlan.label" default="Develop Project Management Plan" />
		
	</label>
	<g:select name="developProjectManagementPlan" from="${ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan.list()}" multiple="multiple" optionKey="id" size="5" value="${costBaselineInstance?.developProjectManagementPlan*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costBaselineInstance, field: 'fundingProject', 'error')} required">
	<label for="fundingProject">
		<g:message code="costBaseline.fundingProject.label" default="Funding Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fundingProject" name="fundingProject.id" from="${ProjectCostManagement.DetermineBudget.FundingProject.list()}" optionKey="id" required="" value="${costBaselineInstance?.fundingProject?.id}" class="many-to-one"/>
</div>

