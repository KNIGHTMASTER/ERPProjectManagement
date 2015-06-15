<%@ page import="ProjectTimeManagement.DefineActivity.ActivityTracking" %>



<div class="fieldcontain ${hasErrors(bean: activityTrackingInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityTracking.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${activityTrackingInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityTrackingInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="activityTracking.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${activityTrackingInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityTrackingInstance, field: 'doWork', 'error')} required">
	<label for="doWork">
		<g:message code="activityTracking.doWork.label" default="Do Work" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="doWork" required="" value="${activityTrackingInstance?.doWork}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityTrackingInstance, field: 'complete', 'error')} required">
	<label for="complete">
		<g:message code="activityTracking.complete.label" default="Complete" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="complete" from="${0..100}" class="range" required="" value="${fieldValue(bean: activityTrackingInstance, field: 'complete')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityTrackingInstance, field: 'hours', 'error')} required">
	<label for="hours">
		<g:message code="activityTracking.hours.label" default="Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="hours" from="${0..24}" class="range" required="" value="${fieldValue(bean: activityTrackingInstance, field: 'hours')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityTrackingInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="activityTracking.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="500" value="${activityTrackingInstance?.note}"/>
</div>

