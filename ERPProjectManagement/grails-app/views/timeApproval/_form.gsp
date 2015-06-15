<%@ page import="ProjectTimeManagement.DevelopSchedule.TimeApproval" %>



<div class="fieldcontain ${hasErrors(bean: timeApprovalInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="timeApproval.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${timeApprovalInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeApprovalInstance, field: 'accepted', 'error')} ">
	<label for="accepted">
		<g:message code="timeApproval.accepted.label" default="Accepted" />
		
	</label>
	<g:checkBox name="accepted" value="${timeApprovalInstance?.accepted}" />
</div>

<div class="fieldcontain ${hasErrors(bean: timeApprovalInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="timeApproval.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${timeApprovalInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: timeApprovalInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="timeApproval.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${timeApprovalInstance?.role?.id}" class="many-to-one"/>
</div>

