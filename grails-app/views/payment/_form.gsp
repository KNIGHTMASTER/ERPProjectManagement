<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="payment.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${paymentInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentMethod', 'error')} ">
	<label for="paymentMethod">
		<g:message code="payment.paymentMethod.label" default="Payment Method" />
		
	</label>
	<g:textField name="paymentMethod" value="${paymentInstance?.paymentMethod}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentAcceptanceCriteria', 'error')} ">
	<label for="paymentAcceptanceCriteria">
		<g:message code="payment.paymentAcceptanceCriteria.label" default="Payment Acceptance Criteria" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${paymentInstance?.paymentAcceptanceCriteria?}" var="p">
    <li><g:link controller="paymentAcceptanceCriteria" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="paymentAcceptanceCriteria" action="create" params="['payment.id': paymentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'paymentAcceptanceCriteria.label', default: 'PaymentAcceptanceCriteria')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="payment.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cost" value="${fieldValue(bean: paymentInstance, field: 'cost')}" required=""/>
</div>

