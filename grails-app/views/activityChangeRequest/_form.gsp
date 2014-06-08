<%@ page import="ProjectTimeManagement.Utility.ActivityChangeRequest" %>



<div class="fieldcontain ${hasErrors(bean: activityChangeRequestInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityChangeRequest.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${activityChangeRequestInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityChangeRequestInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activityChangeRequest.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${activityChangeRequestInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityChangeRequestInstance, field: 'changeDate', 'error')} required">
	<label for="changeDate">
		<g:message code="activityChangeRequest.changeDate.label" default="Change Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="changeDate" precision="day"  value="${activityChangeRequestInstance?.changeDate}"  />
</div>

