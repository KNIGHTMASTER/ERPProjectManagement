<%@ page import="ProjectCostManagement.DetermineBudget.CostManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: costManagementPlanInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="costManagementPlan.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${costManagementPlanInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costManagementPlanInstance, field: 'milestone', 'error')} required">
	<label for="milestone">
		<g:message code="costManagementPlan.milestone.label" default="Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="milestone" name="milestone.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" optionKey="id" required="" value="${costManagementPlanInstance?.milestone?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costManagementPlanInstance, field: 'plannedValue', 'error')} required">
	<label for="plannedValue">
		<g:message code="costManagementPlan.plannedValue.label" default="Planned Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="plannedValue" value="${fieldValue(bean: costManagementPlanInstance, field: 'plannedValue')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: costManagementPlanInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="costManagementPlan.approval.label" default="Approval" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${costManagementPlanInstance?.approval?}" var="a">
    <li><g:link controller="costApproval" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="costApproval" action="create" params="['costManagementPlan.id': costManagementPlanInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'costApproval.label', default: 'CostApproval')])}</g:link>
</li>
</ul>

</div>

