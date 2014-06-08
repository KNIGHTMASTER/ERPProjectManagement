<%@ page import="ProjectCostManagement.DetermineBudget.Budget" %>



<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="budget.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${budgetInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="budget.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="500" value="${budgetInstance?.note}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'monthBudget', 'error')} ">
	<label for="monthBudget">
		<g:message code="budget.monthBudget.label" default="Month Budget" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${budgetInstance?.monthBudget?}" var="m">
    <li><g:link controller="monthBudget" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="monthBudget" action="create" params="['budget.id': budgetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'monthBudget.label', default: 'MonthBudget')])}</g:link>
</li>
</ul>

</div>

