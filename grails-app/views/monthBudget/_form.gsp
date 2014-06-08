<%@ page import="ProjectCostManagement.DetermineBudget.MonthBudget" %>



<div class="fieldcontain ${hasErrors(bean: monthBudgetInstance, field: 'budget', 'error')} required">
	<label for="budget">
		<g:message code="monthBudget.budget.label" default="Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="budget" name="budget.id" from="${ProjectCostManagement.DetermineBudget.Budget.list()}" optionKey="id" required="" value="${monthBudgetInstance?.budget?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: monthBudgetInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="monthBudget.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${monthBudgetInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: monthBudgetInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="monthBudget.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${monthBudgetInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: monthBudgetInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="monthBudget.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="500" value="${monthBudgetInstance?.note}"/>
</div>

