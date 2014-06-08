<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAcManag" %>



<div class="fieldcontain ${hasErrors(bean: financeEvAcManagInstance, field: 'ac', 'error')} required">
	<label for="ac">
		<g:message code="financeEvAcManag.ac.label" default="Ac" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ac" value="${fieldValue(bean: financeEvAcManagInstance, field: 'ac')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeEvAcManagInstance, field: 'evr', 'error')} required">
	<label for="evr">
		<g:message code="financeEvAcManag.evr.label" default="Evr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="evr" value="${fieldValue(bean: financeEvAcManagInstance, field: 'evr')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeEvAcManagInstance, field: 'managementCostActivity', 'error')} required">
	<label for="managementCostActivity">
		<g:message code="financeEvAcManag.managementCostActivity.label" default="Management Cost Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="managementCostActivity" name="managementCostActivity.id" from="${ProjectCostManagement.DetermineBudget.ManagementCostActivity.list()}" optionKey="id" required="" value="${financeEvAcManagInstance?.managementCostActivity?.id}" class="many-to-one"/>
</div>

