<%@ page import="ProjectRiskManagement.Planning.IdentificationRequirementsManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: identificationRequirementsManagementPlanInstance, field: 'requirementsDocumentation', 'error')} ">
	<label for="requirementsDocumentation">
		<g:message code="identificationRequirementsManagementPlan.requirementsDocumentation.label" default="Requirements Documentation" />
		
	</label>
	<g:select id="requirementsDocumentation" name="requirementsDocumentation.id" from="${ProjectScopeManagement.CollectRequirements.RequirementsDocumentation.list()}" optionKey="id" value="${identificationRequirementsManagementPlanInstance?.requirementsDocumentation?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationRequirementsManagementPlanInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationRequirementsManagementPlan.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationRequirementsManagementPlanInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationRequirementsManagementPlanInstance, field: 'risk', 'error')} required">
	<label for="risk">
		<g:message code="identificationRequirementsManagementPlan.risk.label" default="Risk" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="risk" cols="40" rows="5" maxlength="500" required="" value="${identificationRequirementsManagementPlanInstance?.risk}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationRequirementsManagementPlanInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationRequirementsManagementPlan.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationRequirementsManagementPlanInstance?.description}"/>
</div>

