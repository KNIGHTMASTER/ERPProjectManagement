<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostUse" %>



<div class="fieldcontain ${hasErrors(bean: materialCostUseInstance, field: 'usedDate', 'error')} required">
	<label for="usedDate">
		<g:message code="materialCostUse.usedDate.label" default="Used Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="usedDate" precision="day"  value="${materialCostUseInstance?.usedDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostUseInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="materialCostUse.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${materialCostUseInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostUseInstance, field: 'isUsed', 'error')} ">
	<label for="isUsed">
		<g:message code="materialCostUse.isUsed.label" default="Is Used" />
		
	</label>
	<g:checkBox name="isUsed" value="${materialCostUseInstance?.isUsed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostUseInstance, field: 'materialCostActivity', 'error')} required">
	<label for="materialCostActivity">
		<g:message code="materialCostUse.materialCostActivity.label" default="Material Cost Activity" />
		
	</label>
	<g:select id="materialCostActivity" name="materialCostActivity.id" from="${ProjectCostManagement.DetermineBudget.MaterialCostActivity.list()}" optionKey="id" required="" value="${materialCostUseInstance?.materialCostActivity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostUseInstance, field: 'materialCostPayment', 'error')} ">
	<label for="materialCostPayment">
		<g:message code="materialCostUse.materialCostPayment.label" default="Material Cost Payment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materialCostUseInstance?.materialCostPayment?}" var="m">
    <li><g:link controller="materialCostPayment" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materialCostPayment" action="create" params="['materialCostUse.id': materialCostUseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materialCostPayment.label', default: 'MaterialCostPayment')])}</g:link>
</li>
</ul>

</div>

