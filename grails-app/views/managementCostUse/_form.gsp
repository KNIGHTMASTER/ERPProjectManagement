<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostUse" %>



<div class="fieldcontain ${hasErrors(bean: managementCostUseInstance, field: 'managementCostActivity', 'error')} required">
	<label for="managementCostActivity">
		<g:message code="managementCostUse.managementCostActivity.label" default="Management Cost Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="managementCostActivity" name="managementCostActivity.id" from="${ProjectCostManagement.DetermineBudget.ManagementCostActivity.list()}" optionKey="id" required="" value="${managementCostUseInstance?.managementCostActivity?.id}" class="many-to-one"/>
</div>
<tr></tr>
<div class="fieldcontain ${hasErrors(bean: managementCostUseInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="managementCostUse.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: managementCostUseInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostUseInstance, field: 'usedDate', 'error')} required">
	<label for="usedDate">
		<g:message code="managementCostUse.usedDate.label" default="Used Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="usedDate" precision="day"  value="${managementCostUseInstance?.usedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostUseInstance, field: 'isUsed', 'error')} ">
	<label for="isUsed">
		<g:message code="managementCostUse.isUsed.label" default="Is Used" />
		
	</label>
	<g:checkBox name="isUsed" value="${managementCostUseInstance?.isUsed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostUseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="managementCostUse.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${managementCostUseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostUseInstance, field: 'managementCostPayment', 'error')} ">
	<label for="managementCostPayment">
		<g:message code="managementCostUse.managementCostPayment.label" default="Management Cost Payment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${managementCostUseInstance?.managementCostPayment?}" var="m">
    <li><g:link controller="managementCostPayment" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="managementCostPayment" action="create" params="['managementCostUse.id': managementCostUseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'managementCostPayment.label', default: 'ManagementCostPayment')])}</g:link>
</li>
</ul>

</div>

