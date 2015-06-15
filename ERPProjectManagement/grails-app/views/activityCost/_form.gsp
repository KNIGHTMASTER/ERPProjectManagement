<%@ page import="ProjectCostManagement.DetermineBudget.ActivityCost" %>



<div class="fieldcontain ${hasErrors(bean: activityCostInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="activityCost.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cost" name="cost.id" from="${ProjectCostManagement.DetermineBudget.Cost.list()}" optionKey="id" required="" value="${activityCostInstance?.cost?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityCost.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${activityCostInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostInstance, field: 'approve', 'error')} ">
	<label for="approve">
		<g:message code="activityCost.approve.label" default="Approve" />
		
	</label>
	<g:checkBox name="approve" value="${activityCostInstance?.approve}" />
</div>

<div class="fieldcontain ${hasErrors(bean: activityCostInstance, field: 'humanResourceCost', 'error')} ">
	<label for="humanResourceCost">
		<g:message code="activityCost.humanResourceCost.label" default="Human Resource Cost" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${activityCostInstance?.humanResourceCost?}" var="h">
    <li><g:link controller="humanResourceCost" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="humanResourceCost" action="create" params="['activityCost.id': activityCostInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'humanResourceCost.label', default: 'HumanResourceCost')])}</g:link>
</li>
</ul>

</div>

