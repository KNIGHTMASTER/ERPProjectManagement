<%@ page import="ProjectRiskManagement.Planning.IdentificationMaterialCost" %>



<div class="fieldcontain ${hasErrors(bean: identificationMaterialCostInstance, field: 'materialCostActivity', 'error')} ">
	<label for="materialCostActivity">
		<g:message code="identificationMaterialCost.materialCostActivity.label" default="Material Cost Activity" />
		
	</label>
	<g:select id="materialCostActivity" name="materialCostActivity.id" from="${ProjectCostManagement.DetermineBudget.MaterialCostActivity.list()}" optionKey="id" value="${identificationMaterialCostInstance?.materialCostActivity?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationMaterialCostInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationMaterialCost.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationMaterialCostInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationMaterialCostInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationMaterialCost.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationMaterialCostInstance?.description}"/>
</div>

