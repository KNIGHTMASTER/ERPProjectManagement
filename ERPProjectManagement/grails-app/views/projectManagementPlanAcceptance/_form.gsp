<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ProjectManagementPlanAcceptance" %>



<div class="fieldcontain ${hasErrors(bean: projectManagementPlanAcceptanceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectManagementPlanAcceptance.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${projectManagementPlanAcceptanceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectManagementPlanAcceptanceInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="projectManagementPlanAcceptance.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${projectManagementPlanAcceptanceInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectManagementPlanAcceptanceInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="projectManagementPlanAcceptance.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${projectManagementPlanAcceptanceInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectManagementPlanAcceptanceInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="projectManagementPlanAcceptance.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${projectManagementPlanAcceptanceInstance?.comments}"/>
</div>

