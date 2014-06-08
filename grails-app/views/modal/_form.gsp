<%@ page import="ProjectCostManagement.DetermineBudget.Modal" %>



<div class="fieldcontain ${hasErrors(bean: modalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="modal.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${modalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modalInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="modal.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" value="${fieldValue(bean: modalInstance, field: 'value')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: modalInstance, field: 'source', 'error')} ">
	<label for="source">
		<g:message code="modal.source.label" default="Source" />
		
	</label>
	<g:textField name="source" value="${modalInstance?.source}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modalInstance, field: 'datePayment', 'error')} required">
	<label for="datePayment">
		<g:message code="modal.datePayment.label" default="Date Payment" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datePayment" precision="day"  value="${modalInstance?.datePayment}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: modalInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="modal.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${modalInstance?.description}"/>
</div>

