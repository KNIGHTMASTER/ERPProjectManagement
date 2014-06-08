<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.Milestones" %>



<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'idMilestone', 'error')} required">
	<label for="idMilestone">
		<g:message code="milestones.idMilestone.label" default="Id Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idMilestone" type="number" value="${milestonesInstance.idMilestone}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'milestoneName', 'error')} ">
	<label for="milestoneName">
		<g:message code="milestones.milestoneName.label" default="Milestone Name" />
		
	</label>
	<g:textField name="milestoneName" value="${milestonesInstance?.milestoneName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="milestones.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="parent" type="number" value="${milestonesInstance.parent}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="milestones.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${milestonesInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="milestones.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${milestonesInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="milestones.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${milestonesInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'activity', 'error')} ">
	<label for="activity">
		<g:message code="milestones.activity.label" default="Activity" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${milestonesInstance?.activity?}" var="a">
    <li><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activity" action="create" params="['milestones.id': milestonesInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activity.label', default: 'Activity')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'costManagementPlans', 'error')} ">
	<label for="costManagementPlans">
		<g:message code="milestones.costManagementPlans.label" default="Cost Management Plans" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${milestonesInstance?.costManagementPlans?}" var="c">
    <li><g:link controller="costManagementPlan" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="costManagementPlan" action="create" params="['milestones.id': milestonesInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'costManagementPlan.label', default: 'CostManagementPlan')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: milestonesInstance, field: 'idProject', 'error')} required">
	<label for="idProject">
		<g:message code="milestones.idProject.label" default="Id Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="idProject" name="idProject.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${milestonesInstance?.idProject?.id}" class="many-to-one"/>
</div>

