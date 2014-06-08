<%@ page import="ProjectCostManagement.DetermineBudget.Finance3" %>



<div class="fieldcontain ${hasErrors(bean: finance3Instance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="finance3.budget.label" default="Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="budget" name="budget.id" from="${ProjectCostManagement.DetermineBudget.Budget.list()}" optionKey="id" required="" value="${finance3Instance?.budget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: finance3Instance, field: 'income', 'error')} required">
	<label for="income">
		<g:message code="finance3.income.label" default="Income" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="income" value="${fieldValue(bean: finance3Instance, field: 'income')}" required=""/>
</div>

