<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.DevelopProjectManagementPlan" %>



<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="developProjectManagementPlan.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${developProjectManagementPlanInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'planningVersion', 'error')} required">
	<label for="planningVersion">
		<g:message code="developProjectManagementPlan.planningVersion.label" default="Planning Version" />
		<span class="required-indicator">*</span>
	</label>
    <g:field name="planningVersion" type="number" value="${maksimum}" required="" />
</div>

<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'changeManagementPlan', 'error')} ">
	<label for="changeManagementPlan">
		<g:message code="developProjectManagementPlan.changeManagementPlan.label" default="Change Management Plan" />
		
	</label>
	<g:select id="changeManagementPlan" name="changeManagementPlan.id" from="${changeManagement}" optionKey="id" value="${developProjectManagementPlanInstance?.changeManagementPlan?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'scopeManagementPlan', 'error')} ">
	<label for="scopeManagementPlan">
		<g:message code="developProjectManagementPlan.scopeManagementPlan.label" default="Scope Management Plan" />
		
	</label>
	<g:select id="scopeManagementPlan" name="scopeManagementPlan.id" from="${scope}" optionKey="id" value="${developProjectManagementPlanInstance?.scopeManagementPlan?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'requirementsDocumentation', 'error')} ">
	<label for="requirementsDocumentation">
		<g:message code="developProjectManagementPlan.requirementsDocumentation.label" default="Requirements Documentation" />
		
	</label>
	<g:select name="requirementsDocumentation" from="${requirementsDoc}" multiple="multiple" optionKey="id" size="5" value="${developProjectManagementPlanInstance?.requirementsDocumentation*.id}" class="many-to-many"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'requirementsManagementPlan', 'error')} ">
	<label for="requirementsManagementPlan">
		<g:message code="developProjectManagementPlan.requirementsManagementPlan.label" default="Requirements Management Plan" />
		
	</label>
	<g:select name="requirementsManagementPlan" from="${requirementManage}" multiple="multiple" optionKey="id" size="5" value="${developProjectManagementPlanInstance?.requirementsManagementPlan*.id}" class="many-to-many"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'timeManagementPlans', 'error')} ">
	<label for="timeManagementPlans">
		<g:message code="developProjectManagementPlan.timeManagementPlans.label" default="Time Management Plans" />
		
	</label>
	    <g:select name="timeManagementPlans" from="${timeManagement}" multiple="multiple" optionKey="id" size="5" value="${developProjectManagementPlanInstance?.timeManagementPlans*.id}" class="many-to-many"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'costManagementPlans', 'error')} ">
	<label for="costManagementPlans">
		<g:message code="developProjectManagementPlan.costManagementPlans.label" default="Cost Management Plans" />
		
	</label>
	<g:select name="costManagementPlans" from="${costManagement}" multiple="multiple" optionKey="id" size="5" value="${developProjectManagementPlanInstance?.costManagementPlans*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'riskManagementPlans', 'error')} ">
	<label for="riskManagementPlans">
		<g:message code="developProjectManagementPlan.riskManagementPlans.label" default="Risk Management Plans" />
		
	</label>
	<g:select name="riskManagementPlans" from="${riskManagement}" multiple="multiple" optionKey="id" size="5" value="${developProjectManagementPlanInstance?.riskManagementPlans*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'communicationManagementPlan', 'error')} ">
	<label for="communicationManagementPlan">
		<g:message code="developProjectManagementPlan.communicationManagementPlan.label" default="Communication Management Plan" />
		
	</label>
	<g:select id="communicationManagementPlan" name="communicationManagementPlan.id" from="${communicationManagement}" optionKey="id" value="${developProjectManagementPlanInstance?.communicationManagementPlan?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'procurementManagementPlans', 'error')} ">
	<label for="procurementManagementPlans">
		<g:message code="developProjectManagementPlan.procurementManagementPlans.label" default="Procurement Management Plans" />
		
	</label>
	<g:select name="procurementManagementPlans" from="${procurementManagement}" multiple="multiple" optionKey="id" size="5" value="${developProjectManagementPlanInstance?.procurementManagementPlans*.id}" class="many-to-many"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: developProjectManagementPlanInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="developProjectManagementPlan.approval.label" default="Approval" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${developProjectManagementPlanInstance?.approval?}" var="a">
    <li><g:link controller="projectManagementPlanAcceptance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectManagementPlanAcceptance" action="create" params="['developProjectManagementPlan.id': developProjectManagementPlanInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectManagementPlanAcceptance.label', default: 'ProjectManagementPlanAcceptance')])}</g:link>
</li>
</ul>

</div>

