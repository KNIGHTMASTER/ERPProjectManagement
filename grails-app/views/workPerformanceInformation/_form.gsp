<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.WorkPerformanceInformation" %>



<div class="fieldcontain ${hasErrors(bean: workPerformanceInformationInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="workPerformanceInformation.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${workPerformanceInformationInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPerformanceInformationInstance, field: 'dateEnding', 'error')} required">
	<label for="dateEnding">
		<g:message code="workPerformanceInformation.dateEnding.label" default="Date Ending" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateEnding" precision="day"  value="${workPerformanceInformationInstance?.dateEnding}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: workPerformanceInformationInstance, field: 'workPlannedLastStep', 'error')} ">
	<label for="workPlannedLastStep">
		<g:message code="workPerformanceInformation.workPlannedLastStep.label" default="Work Planned Last Step" />
		
	</label>
	<g:textArea name="workPlannedLastStep" cols="40" rows="5" maxlength="1000" value="${workPerformanceInformationInstance?.workPlannedLastStep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPerformanceInformationInstance, field: 'workCompletedLastStep', 'error')} ">
	<label for="workCompletedLastStep">
		<g:message code="workPerformanceInformation.workCompletedLastStep.label" default="Work Completed Last Step" />
		
	</label>
	<g:textArea name="workCompletedLastStep" cols="40" rows="5" maxlength="1000" value="${workPerformanceInformationInstance?.workCompletedLastStep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPerformanceInformationInstance, field: 'workPlannedNextStep', 'error')} ">
	<label for="workPlannedNextStep">
		<g:message code="workPerformanceInformation.workPlannedNextStep.label" default="Work Planned Next Step" />
		
	</label>
	<g:textArea name="workPlannedNextStep" cols="40" rows="5" maxlength="1000" value="${workPerformanceInformationInstance?.workPlannedNextStep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workPerformanceInformationInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="workPerformanceInformation.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${workPerformanceInformationInstance?.activity?.id}" class="many-to-one"/>
</div>

