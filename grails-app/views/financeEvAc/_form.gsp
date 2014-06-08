<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAc" %>



<div class="fieldcontain ${hasErrors(bean: financeEvAcInstance, field: 'activityCost', 'error')} ">
	<label for="activityCost">
		<g:message code="financeEvAc.activityCost.label" default="Activity Cost" />
		
	</label>
	<g:select id="activityCost" name="activityCost.id" from="${ProjectCostManagement.DetermineBudget.ActivityCost.list()}" optionKey="id" value="${financeEvAcInstance?.activityCost?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeEvAcInstance, field: 'evr', 'error')} required">
	<label for="evr">
		<g:message code="financeEvAc.evr.label" default="Evr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="evr" value="${fieldValue(bean: financeEvAcInstance, field: 'evr')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeEvAcInstance, field: 'ac', 'error')} required">
	<label for="ac">
		<g:message code="financeEvAc.ac.label" default="Ac" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ac" value="${fieldValue(bean: financeEvAcInstance, field: 'ac')}" required=""/>
</div>

