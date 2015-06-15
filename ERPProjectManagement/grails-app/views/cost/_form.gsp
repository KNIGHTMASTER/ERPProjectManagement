<%@ page import="ProjectCostManagement.DetermineBudget.Cost" %>


<div class="fieldcontain ${hasErrors(bean: costInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="cost.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${costInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costInstance, field: 'costProject', 'error')} required">
	<label for="costProject">
		<g:message code="cost.costProject.label" default="Cost Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="costProject" name="costProject.id" from="${ProjectCostManagement.DetermineBudget.CostManagementPlan.list()}" optionKey="id" required="" value="${costInstance?.costProject?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="cost.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${costInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costInstance, field: 'humanCost', 'error')} ">
	<label for="humanCost">
		<g:message code="cost.humanCost.label" default="Human Cost" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${costInstance?.humanCost?}" var="h">
    <li><g:link controller="activityCost" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="activityCost" action="create" params="['cost.id': costInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'activityCost.label', default: 'ActivityCost')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: costInstance, field: 'managementCost', 'error')} ">
	<label for="managementCost">
		<g:message code="cost.managementCost.label" default="Management Cost" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${costInstance?.managementCost?}" var="m">
    <li><g:link controller="managementCostActivity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="managementCostActivity" action="create" params="['cost.id': costInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'managementCostActivity.label', default: 'ManagementCostActivity')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: costInstance, field: 'materialCost', 'error')} ">
	<label for="materialCost">
		<g:message code="cost.materialCost.label" default="Material Cost" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${costInstance?.materialCost?}" var="m">
    <li><g:link controller="materialCostActivity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materialCostActivity" action="create" params="['cost.id': costInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materialCostActivity.label', default: 'MaterialCostActivity')])}</g:link>
</li>
</ul>

</div>