<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAcMaterial" %>



<div class="fieldcontain ${hasErrors(bean: financeEvAcMaterialInstance, field: 'ac', 'error')} required">
	<label for="ac">
		<g:message code="financeEvAcMaterial.ac.label" default="Ac" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ac" value="${fieldValue(bean: financeEvAcMaterialInstance, field: 'ac')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeEvAcMaterialInstance, field: 'evr', 'error')} required">
	<label for="evr">
		<g:message code="financeEvAcMaterial.evr.label" default="Evr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="evr" value="${fieldValue(bean: financeEvAcMaterialInstance, field: 'evr')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: financeEvAcMaterialInstance, field: 'materialCostActivity', 'error')} required">
	<label for="materialCostActivity">
		<g:message code="financeEvAcMaterial.materialCostActivity.label" default="Material Cost Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialCostActivity" name="materialCostActivity.id" from="${ProjectCostManagement.DetermineBudget.MaterialCostActivity.list()}" optionKey="id" required="" value="${financeEvAcMaterialInstance?.materialCostActivity?.id}" class="many-to-one"/>
</div>

