<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.HandOverAcceptance" %>



<div class="fieldcontain ${hasErrors(bean: handOverAcceptanceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="handOverAcceptance.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${handOverAcceptanceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: handOverAcceptanceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="handOverAcceptance.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="name" name="name.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${handOverAcceptanceInstance?.name?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: handOverAcceptanceInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="handOverAcceptance.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${handOverAcceptanceInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: handOverAcceptanceInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="handOverAcceptance.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${handOverAcceptanceInstance?.comments}"/>
</div>

