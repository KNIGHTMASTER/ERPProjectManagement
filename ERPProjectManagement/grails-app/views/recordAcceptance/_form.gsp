<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.RecordAcceptance" %>



<div class="fieldcontain ${hasErrors(bean: recordAcceptanceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="recordAcceptance.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord.list()}" optionKey="id" required="" value="${recordAcceptanceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordAcceptanceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="recordAcceptance.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="name" name="name.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${recordAcceptanceInstance?.name?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recordAcceptanceInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="recordAcceptance.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${recordAcceptanceInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: recordAcceptanceInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="recordAcceptance.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${recordAcceptanceInstance?.comments}"/>
</div>

