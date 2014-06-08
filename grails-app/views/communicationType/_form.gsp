<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.CommunicationType" %>



<div class="fieldcontain ${hasErrors(bean: communicationTypeInstance, field: 'statementOfWork', 'error')} required">
	<label for="statementOfWork">
		<g:message code="communicationType.statementOfWork.label" default="Statement Of Work" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="statementOfWork" name="statementOfWork.id" from="${namaProyek}" optionKey="id" required="" value="${communicationTypeInstance?.statementOfWork?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: communicationTypeInstance, field: 'communicationType', 'error')} required">
	<label for="communicationType">
		<g:message code="communicationType.communicationType.label" default="Communication Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="communicationType" required="" value="${communicationTypeInstance?.communicationType}"/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: communicationTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="communicationType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${communicationTypeInstance?.description}"/>
</div>

