<%@ page import="ProjectCostManagement.DetermineBudget.MaterialCostPayment" %>



<div class="fieldcontain ${hasErrors(bean: materialCostPaymentInstance, field: 'paymentDate', 'error')} required">
	<label for="paymentDate">
		<g:message code="materialCostPayment.paymentDate.label" default="Payment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="paymentDate" precision="day"  value="${materialCostPaymentInstance?.paymentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostPaymentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="materialCostPayment.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${materialCostPaymentInstance.amount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostPaymentInstance, field: 'isPayed', 'error')} ">
	<label for="isPayed">
		<g:message code="materialCostPayment.isPayed.label" default="Is Payed" />
		
	</label>
	<g:checkBox name="isPayed" value="${materialCostPaymentInstance?.isPayed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: materialCostPaymentInstance, field: 'materialCost', 'error')} required">
	<label for="materialCost">
		<g:message code="materialCostPayment.materialCost.label" default="Material Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialCost" name="materialCost.id" from="${ProjectCostManagement.DetermineBudget.MaterialCostActivity.list()}" optionKey="id" required="" value="${materialCostPaymentInstance?.materialCost?.id}" class="many-to-one"/>
</div>

