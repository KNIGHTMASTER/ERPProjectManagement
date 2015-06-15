<%@ page import="ProjectCostManagement.DetermineBudget.FinanceOcm" %>



<div class="fieldcontain ${hasErrors(bean: financeOcmInstance, field: 'monthBudget', 'error')} required">
	<label for="monthBudget">
		<g:message code="financeOcm.monthBudget.label" default="Month Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="monthBudget" name="monthBudget.id" from="${ProjectCostManagement.DetermineBudget.MonthBudget.list()}" optionKey="id" required="" value="${financeOcmInstance?.monthBudget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeOcmInstance, field: 'outcome', 'error')} required">
	<label for="outcome">
		<g:message code="financeOcm.outcome.label" default="Outcome" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="outcome" value="${fieldValue(bean: financeOcmInstance, field: 'outcome')}" required=""/>
</div>

