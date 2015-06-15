<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.AcceptanceCriteria" %>



<div class="fieldcontain ${hasErrors(bean: acceptanceCriteriaInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="acceptanceCriteria.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${acceptanceCriteriaInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: acceptanceCriteriaInstance, field: 'dateAcceptance', 'error')} required">
	<label for="dateAcceptance">
		<g:message code="acceptanceCriteria.dateAcceptance.label" default="Date Acceptance" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateAcceptance" precision="day"  value="${acceptanceCriteriaInstance?.dateAcceptance}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: acceptanceCriteriaInstance, field: 'methodOfAcceptance', 'error')} ">
	<label for="methodOfAcceptance">
		<g:message code="acceptanceCriteria.methodOfAcceptance.label" default="Method Of Acceptance" />
		
	</label>
	<g:textField name="methodOfAcceptance" value="${acceptanceCriteriaInstance?.methodOfAcceptance}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: acceptanceCriteriaInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="acceptanceCriteria.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="authority" name="authority.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${acceptanceCriteriaInstance?.authority?.id}" class="many-to-one"/>
</div>

