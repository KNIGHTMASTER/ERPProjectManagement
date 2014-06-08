<%@ page import="ProjectRiskManagement.Planning.AnalysisCostManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: analysisCostManagementPlanInstance, field: 'identificationCostManagementPlan', 'error')} ">
	<label for="identificationCostManagementPlan">
		<g:message code="analysisCostManagementPlan.identificationCostManagementPlan.label" default="Identification Cost Management Plan" />
		
	</label>
	<g:select id="identificationCostManagementPlan" name="identificationCostManagementPlan.id" from="${ProjectRiskManagement.Planning.IdentificationCostManagementPlan.list()}" optionKey="id" value="${analysisCostManagementPlanInstance?.identificationCostManagementPlan?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisCostManagementPlanInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="analysisCostManagementPlan.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${analysisCostManagementPlanInstance.ranking}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisCostManagementPlanInstance, field: 'subCategories', 'error')} ">
	<label for="subCategories">
		<g:message code="analysisCostManagementPlan.subCategories.label" default="Sub Categories" />
		
	</label>
	<g:select id="subCategories" name="subCategories.id" from="${ProjectRiskManagement.Planning.SubCategories.list()}" optionKey="id" value="${analysisCostManagementPlanInstance?.subCategories?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analysisCostManagementPlanInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="analysisCostManagementPlan.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" required="" value="${analysisCostManagementPlanInstance?.description}"/>
</div>

