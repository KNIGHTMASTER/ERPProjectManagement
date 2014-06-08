<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectAcceptance" %>



<div class="fieldcontain ${hasErrors(bean: projectAcceptanceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectAcceptance.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal.list()}" optionKey="id" required="" value="${projectAcceptanceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectAcceptanceInstance, field: 'stakeholder', 'error')} ">
	<label for="stakeholder">
		<g:message code="projectAcceptance.stakeholder.label" default="Stakeholder" />
		
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" value="${projectAcceptanceInstance?.stakeholder?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectAcceptanceInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="projectAcceptance.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${projectAcceptanceInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectAcceptanceInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="projectAcceptance.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${projectAcceptanceInstance?.comments}"/>
</div>

