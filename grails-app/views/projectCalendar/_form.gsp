<%@ page import="ProjectTimeManagement.DefineActivity.ProjectCalendar" %>



<div class="fieldcontain ${hasErrors(bean: projectCalendarInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="projectCalendar.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${projectCalendarInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCalendarInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="projectCalendar.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${projectCalendarInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: projectCalendarInstance, field: 'dayType', 'error')} required">
	<label for="dayType">
		<g:message code="projectCalendar.dayType.label" default="Day Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dayType" required="" value="${projectCalendarInstance?.dayType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCalendarInstance, field: 'workTime', 'error')} required">
	<label for="workTime">
		<g:message code="projectCalendar.workTime.label" default="Work Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="workTime" from="${0..24}" class="range" required="" value="${fieldValue(bean: projectCalendarInstance, field: 'workTime')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCalendarInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="projectCalendar.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${projectCalendarInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectCalendarInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="projectCalendar.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${projectCalendarInstance?.description}"/>
</div>

