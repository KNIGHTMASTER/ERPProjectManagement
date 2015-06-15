<%@ page import="ProjectRiskManagement.Planning.IdentificationCostManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: identificationCostManagementPlanInstance, field: 'costManagementPlan', 'error')} ">
	<label for="costManagementPlan">
		<g:message code="identificationCostManagementPlan.costManagementPlan.label" default="Cost Management Plan" />
		
	</label>
	<g:select id="costManagementPlan" name="costManagementPlan.id" from="${ProjectCostManagement.DetermineBudget.CostManagementPlan.list()}" optionKey="id" value="${identificationCostManagementPlanInstance?.costManagementPlan?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationCostManagementPlanInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationCostManagementPlan.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationCostManagementPlanInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationCostManagementPlanInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationCostManagementPlan.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationCostManagementPlanInstance?.description}"/>
</div>

