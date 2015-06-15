<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.PaymentAcceptanceCriteria" %>



<div class="fieldcontain ${hasErrors(bean: paymentAcceptanceCriteriaInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="paymentAcceptanceCriteria.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${paymentAcceptanceCriteriaInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentAcceptanceCriteriaInstance, field: 'payment', 'error')} required">
	<label for="payment">
		<g:message code="paymentAcceptanceCriteria.payment.label" default="Payment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="payment" name="payment.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Payment.list()}" optionKey="id" required="" value="${paymentAcceptanceCriteriaInstance?.payment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentAcceptanceCriteriaInstance, field: 'acceptanceCriteria', 'error')} ">
	<label for="acceptanceCriteria">
		<g:message code="paymentAcceptanceCriteria.acceptanceCriteria.label" default="Acceptance Criteria" />
		
	</label>
	<g:textField name="acceptanceCriteria" value="${paymentAcceptanceCriteriaInstance?.acceptanceCriteria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentAcceptanceCriteriaInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="paymentAcceptanceCriteria.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${paymentAcceptanceCriteriaInstance?.description}"/>
</div>

