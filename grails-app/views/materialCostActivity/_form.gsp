<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostActivity" %>



<div class="fieldcontain ${hasErrors(bean: materialCostActivityInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="materialCostActivity.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cost" name="cost.id" from="${ProjectCostManagement.DetermineBudget.Cost.list()}" optionKey="id" required="" value="${materialCostActivityInstance?.cost?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostActivityInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="materialCostActivity.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${materialCostActivityInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostActivityInstance, field: 'approve', 'error')} ">
	<label for="approve">
		<g:message code="materialCostActivity.approve.label" default="Approve" />
		
	</label>
	<g:checkBox name="approve" value="${materialCostActivityInstance?.approve}" />
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostActivityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="materialCostActivity.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${materialCostActivityInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostActivityInstance, field: 'material', 'error')} required">
	<label for="material">
		<g:message code="materialCostActivity.material.label" default="Material" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="material" name="material.id" from="${ProjectProcurementManagement.AdministerProcurements.PurchaseVendor.list()}" optionKey="id" required="" value="${materialCostActivityInstance?.material?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostActivityInstance, field: 'materialCostUse', 'error')} ">
	<label for="materialCostUse">
		<g:message code="materialCostActivity.materialCostUse.label" default="Material Cost Use" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materialCostActivityInstance?.materialCostUse?}" var="m">
    <li><g:link controller="materialCostUse" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materialCostUse" action="create" params="['materialCostActivity.id': materialCostActivityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materialCostUse.label', default: 'MaterialCostUse')])}</g:link>
</li>
</ul>

</div>

