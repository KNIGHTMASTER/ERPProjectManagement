<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.CommunicationMethods" %>



<div class="fieldcontain ${hasErrors(bean: communicationMethodsInstance, field: 'communicationMethods', 'error')} required">
	<label for="communicationMethods">
		<g:message code="communicationMethods.communicationMethods.label" default="Communication Methods" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="communicationMethods" required="" value="${communicationMethodsInstance?.communicationMethods}"/>
</div>

