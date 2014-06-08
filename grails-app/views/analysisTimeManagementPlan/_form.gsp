<%@ page import="ProjectRiskManagement.Planning.AnalysisTimeManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: analysisTimeManagementPlanInstance, field: 'identificationTimeManagementPlan', 'error')} ">
	<label for="identificationTimeManagementPlan">
		<g:message code="analysisTimeManagementPlan.identificationTimeManagementPlan.label" default="Identification Time Management Plan" />
		
	</label>
	<g:select id="identificationTimeManagementPlan" name="identificationTimeManagementPlan.id" from="${ProjectRiskManagement.Planning.IdentificationTimeManagementPlan.list()}" optionKey="id" value="${analysisTimeManagementPlanInstance?.identificationTimeManagementPlan?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisTimeManagementPlanInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="analysisTimeManagementPlan.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${analysisTimeManagementPlanInstance.ranking}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisTimeManagementPlanInstance, field: 'subCategories', 'error')} ">
	<label for="subCategories">
		<g:message code="analysisTimeManagementPlan.subCategories.label" default="Sub Categories" />
		
	</label>
	<g:select id="subCategories" name="subCategories.id" from="${ProjectRiskManagement.Planning.SubCategories.list()}" optionKey="id" value="${analysisTimeManagementPlanInstance?.subCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisTimeManagementPlanInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="analysisTimeManagementPlan.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${analysisTimeManagementPlanInstance?.description}"/>
</div>

