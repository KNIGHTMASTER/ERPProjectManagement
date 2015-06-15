<%@ page import="ProjectTimeManagement.DefineActivity.DelayActivity" %>



<div class="fieldcontain ${hasErrors(bean: delayActivityInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="delayActivity.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${delayActivityInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: delayActivityInstance, field: 'planningEndDate', 'error')} required">
	<label for="planningEndDate">
		<g:message code="delayActivity.planningEndDate.label" default="Finishing" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="planningEndDate" precision="day"  value="${delayActivityInstance?.planningEndDate}"  />
</div>

