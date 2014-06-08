<%@ page import="ProjectCostManagement.DetermineBudget.ManagementCostPayment" %>



<div class="fieldcontain ${hasErrors(bean: managementCostPaymentInstance, field: 'paymentDate', 'error')} required">
	<label for="paymentDate">
		<g:message code="managementCostPayment.paymentDate.label" default="Payment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="paymentDate" precision="day"  value="${managementCostPaymentInstance?.paymentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostPaymentInstance, field: 'managementCostUse', 'error')} required">
	<label for="managementCostUse">
		<g:message code="managementCostPayment.managementCostUse.label" default="Management Cost Use" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="managementCostUse" name="managementCostUse.id" from="${ProjectCostManagement.DetermineBudget.ManagementCostUse.list()}" optionKey="id" required="" value="${managementCostPaymentInstance?.managementCostUse?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostPaymentInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="managementCostPayment.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: managementCostPaymentInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostPaymentInstance, field: 'isPayed', 'error')} ">
	<label for="isPayed">
		<g:message code="managementCostPayment.isPayed.label" default="Is Payed" />
		
	</label>
	<g:checkBox name="isPayed" value="${managementCostPaymentInstance?.isPayed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: managementCostPaymentInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="managementCostPayment.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${managementCostPaymentInstance?.description}"/>
</div>

