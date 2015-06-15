<%@ page import="ProjectCostManagement.DetermineBudget.SalaryHumanResource" %>



<div class="fieldcontain ${hasErrors(bean: salaryHumanResourceInstance, field: 'humanResourceCost', 'error')} required">
	<label for="humanResourceCost">
		<g:message code="salaryHumanResource.humanResourceCost.label" default="Human Resource Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="humanResourceCost" name="humanResourceCost.id" from="${ProjectCostManagement.DetermineBudget.HumanResourceCost.list()}" optionKey="id" required="" value="${salaryHumanResourceInstance?.humanResourceCost?.id}" class="many-to-one"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: salaryHumanResourceInstance, field: 'paymentDate', 'error')} required">
	<label for="paymentDate">
		<g:message code="salaryHumanResource.paymentDate.label" default="Payment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="paymentDate" precision="day"  value="${salaryHumanResourceInstance?.paymentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: salaryHumanResourceInstance, field: 'isPayed', 'error')} ">
	<label for="isPayed">
		<g:message code="salaryHumanResource.isPayed.label" default="Is Payed" />
		
	</label>
	<g:checkBox name="isPayed" value="${salaryHumanResourceInstance?.isPayed}" />
</div>

