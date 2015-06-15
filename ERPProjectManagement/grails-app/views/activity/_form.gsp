<%@ page import="ProjectTimeManagement.DefineActivity.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'idMilestone', 'error')} required">
	<label for="idMilestone">
		<g:message code="activity.idMilestone.label" default="Id Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idMilestone" name="idMilestone.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" optionKey="id" required="" value="${activityInstance?.idMilestone?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'idTask', 'error')} required">
	<label for="idTask">
		<g:message code="activity.idTask.label" default="Id Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idTask" type="number" value="${activityInstance.idTask}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'taskName', 'error')} required">
	<label for="taskName">
		<g:message code="activity.taskName.label" default="Task Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="taskName" name="taskName.id" from="${ProjectTimeManagement.DefineActivity.Task.list()}" optionKey="id" required="" value="${activityInstance?.taskName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'duration', 'error')} required">
	<label for="duration">
		<g:message code="activity.duration.label" default="Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duration" type="number" value="${activityInstance.duration}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'resources', 'error')} ">
	<label for="resources">
		<g:message code="activity.resources.label" default="Resources" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityInstance?.resources?}" var="r">
    <li><g:link controller="teamDevelopment" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="teamDevelopment" action="create" params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamDevelopment.label', default: 'TeamDevelopment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'predecessors', 'error')} ">
	<label for="predecessors">
		<g:message code="activity.predecessors.label" default="Predecessors" />
		
	</label>
	<g:select name="predecessors" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" multiple="multiple" optionKey="id" size="5" value="${activityInstance?.predecessors*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="activity.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${activityInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="activity.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${activityInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'materials', 'error')} ">
	<label for="materials">
		<g:message code="activity.materials.label" default="Materials" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityInstance?.materials?}" var="m">
    <li><g:link controller="requirementProcurement" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requirementProcurement" action="create" params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requirementProcurement.label', default: 'RequirementProcurement')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'timeApproval', 'error')} ">
	<label for="timeApproval">
		<g:message code="activity.timeApproval.label" default="Time Approval" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityInstance?.timeApproval?}" var="t">
    <li><g:link controller="timeApproval" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="timeApproval" action="create" params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'timeApproval.label', default: 'TimeApproval')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'trackings', 'error')} ">
	<label for="trackings">
		<g:message code="activity.trackings.label" default="Trackings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityInstance?.trackings?}" var="t">
    <li><g:link controller="activityTracking" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activityTracking" action="create" params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activityTracking.label', default: 'ActivityTracking')])}</g:link>
</li>
</ul>

</div>

