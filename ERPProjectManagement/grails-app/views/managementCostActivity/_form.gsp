<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostActivity" %>



<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="managementCostActivity.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cost" name="cost.id" from="${ProjectCostManagement.DetermineBudget.Cost.list()}" optionKey="id" required="" value="${managementCostActivityInstance?.cost?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'detail', 'error')} required">
	<label for="detail">
		<g:message code="managementCostActivity.detail.label" default="Detail" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="detail" required="" value="${managementCostActivityInstance?.detail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="managementCostActivity.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: managementCostActivityInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'startDate', 'error')} ">
	<label for="startDate">
		<g:message code="managementCostActivity.startDate.label" default="Start Date" />
		
	</label>
	<g:datePicker name="startDate" precision="day"  value="${managementCostActivityInstance?.startDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="managementCostActivity.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${managementCostActivityInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="managementCostActivity.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${managementCostActivityInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'approve', 'error')} ">
	<label for="approve">
		<g:message code="managementCostActivity.approve.label" default="Approve" />
		
	</label>
	<g:checkBox name="approve" value="${managementCostActivityInstance?.approve}" />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostActivityInstance, field: 'managementCostUse', 'error')} ">
	<label for="managementCostUse">
		<g:message code="managementCostActivity.managementCostUse.label" default="Management Cost Use" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${managementCostActivityInstance?.managementCostUse?}" var="m">
    <li><g:link controller="managementCostUse" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="managementCostUse" action="create" params="['managementCostActivity.id': managementCostActivityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'managementCostUse.label', default: 'ManagementCostUse')])}</g:link>
</li>
</ul>

</div>

