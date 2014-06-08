<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PeriodOfPerformance" %>



<div class="fieldcontain ${hasErrors(bean: periodOfPerformanceInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="periodOfPerformance.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${periodOfPerformanceInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: periodOfPerformanceInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="periodOfPerformance.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${periodOfPerformanceInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: periodOfPerformanceInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="periodOfPerformance.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${periodOfPerformanceInstance?.endDate}"  />
</div>

