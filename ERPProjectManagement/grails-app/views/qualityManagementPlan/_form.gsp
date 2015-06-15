<%@ page import="ProjectQualityManagement.QualityManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: qualityManagementPlanInstance, field: 'projectCharter', 'error')} required">
	<label for="projectCharter">
		<g:message code="qualityManagementPlan.projectCharter.label" default="Project Charter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectCharter" name="projectCharter.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${qualityManagementPlanInstance?.projectCharter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: qualityManagementPlanInstance, field: 'qualityAssuranceApproach', 'error')} required">
	<label for="qualityAssuranceApproach">
		<g:message code="qualityManagementPlan.qualityAssuranceApproach.label" default="Quality Assurance Approach" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="qualityAssuranceApproach" cols="40" rows="5" maxlength="500" required="" value="${qualityManagementPlanInstance?.qualityAssuranceApproach}"/>
</div>

