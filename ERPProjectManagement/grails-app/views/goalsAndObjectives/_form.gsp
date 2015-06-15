<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.GoalsAndObjectives" %>



<div class="fieldcontain ${hasErrors(bean: goalsAndObjectivesInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="goalsAndObjectives.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectOverview.list()}" optionKey="id" required="" value="${goalsAndObjectivesInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: goalsAndObjectivesInstance, field: 'goalsAndObjective', 'error')} ">
	<label for="goalsAndObjective">
		<g:message code="goalsAndObjectives.goalsAndObjective.label" default="Goals And Objective" />
		
	</label>
	<g:textArea name="goalsAndObjective" cols="40" rows="5" maxlength="2000" value="${goalsAndObjectivesInstance?.goalsAndObjective}"/>
</div>

