<%@ page import="ProjectTimeManagement.EstimateResourceActivity.ActivityManday" %>



<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="activityManday.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${activityMandayInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityManday.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${activityMandayInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="activityManday.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${activityMandayInstance?.employee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'doWork', 'error')} ">
	<label for="doWork">
		<g:message code="activityManday.doWork.label" default="Do Work" />
		
	</label>
	<g:textField name="doWork" value="${activityMandayInstance?.doWork}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activityManday.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${activityMandayInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'startWorks', 'error')} ">
	<label for="startWorks">
		<g:message code="activityManday.startWorks.label" default="Start Works" />
		
	</label>
	<g:datePicker name="startWorks" precision="day"  value="${activityMandayInstance?.startWorks}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'endWorks', 'error')} ">
	<label for="endWorks">
		<g:message code="activityManday.endWorks.label" default="End Works" />
		
	</label>
	<g:datePicker name="endWorks" precision="day"  value="${activityMandayInstance?.endWorks}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: activityMandayInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="activityManday.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${activityMandayInstance?.active}" />
</div>

