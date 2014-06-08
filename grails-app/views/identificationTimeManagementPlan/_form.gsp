<%@ page import="ProjectRiskManagement.Planning.IdentificationTimeManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: identificationTimeManagementPlanInstance, field: 'activity', 'error')} ">
	<label for="activity">
		<g:message code="identificationTimeManagementPlan.activity.label" default="Activity" />
		
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" value="${identificationTimeManagementPlanInstance?.activity?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationTimeManagementPlanInstance, field: 'riskCategories', 'error')} ">
	<label for="riskCategories">
		<g:message code="identificationTimeManagementPlan.riskCategories.label" default="Risk Categories" />
		
	</label>
	<g:select id="riskCategories" name="riskCategories.id" from="${ProjectRiskManagement.Planning.RiskCategories.list()}" optionKey="id" value="${identificationTimeManagementPlanInstance?.riskCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: identificationTimeManagementPlanInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="identificationTimeManagementPlan.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${identificationTimeManagementPlanInstance?.description}"/>
</div>

