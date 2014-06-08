<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.PhaseRecord" %>



<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="phaseRecord.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${phaseRecordInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'projectSummary', 'error')} ">
	<label for="projectSummary">
		<g:message code="phaseRecord.projectSummary.label" default="Project Summary" />
		
	</label>
	<g:textArea name="projectSummary" cols="40" rows="5" maxlength="2000" value="${phaseRecordInstance?.projectSummary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'transitionToOperation', 'error')} ">
	<label for="transitionToOperation">
		<g:message code="phaseRecord.transitionToOperation.label" default="Transition To Operation" />
		
	</label>
	<g:textArea name="transitionToOperation" cols="40" rows="5" maxlength="2000" value="${phaseRecordInstance?.transitionToOperation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'projectCost', 'error')} required">
	<label for="projectCost">
		<g:message code="phaseRecord.projectCost.label" default="Project Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="projectCost" value="${fieldValue(bean: phaseRecordInstance, field: 'projectCost')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'projectSchedule', 'error')} ">
	<label for="projectSchedule">
		<g:message code="phaseRecord.projectSchedule.label" default="Project Schedule" />
		
	</label>
	<g:textArea name="projectSchedule" cols="40" rows="5" maxlength="2000" value="${phaseRecordInstance?.projectSchedule}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'recommendations', 'error')} ">
	<label for="recommendations">
		<g:message code="phaseRecord.recommendations.label" default="Recommendations" />
		
	</label>
	<g:textArea name="recommendations" cols="40" rows="5" maxlength="2000" value="${phaseRecordInstance?.recommendations}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: phaseRecordInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="phaseRecord.acceptance.label" default="Acceptance" />
		
	</label>
	<g:select name="acceptance" from="${ProjectIntegrationManagement.CloseProjectOrPhase.RecordAcceptance.list()}" multiple="multiple" optionKey="id" size="5" value="${phaseRecordInstance?.acceptance*.id}" class="many-to-many"/>
</div>

