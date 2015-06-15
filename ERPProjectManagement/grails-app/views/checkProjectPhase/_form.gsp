<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.CheckProjectPhase" %>



<div class="fieldcontain ${hasErrors(bean: checkProjectPhaseInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="checkProjectPhase.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${checkProjectPhaseInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: checkProjectPhaseInstance, field: 'projectPhase', 'error')} ">
	<label for="projectPhase">
		<g:message code="checkProjectPhase.projectPhase.label" default="Project Phase" />
		
	</label>
	<g:select name="projectPhase" from="${checkProjectPhaseInstance.constraints.projectPhase.inList}" value="${checkProjectPhaseInstance?.projectPhase}" valueMessagePrefix="checkProjectPhase.projectPhase" noSelection="['': '']"/>
</div>

