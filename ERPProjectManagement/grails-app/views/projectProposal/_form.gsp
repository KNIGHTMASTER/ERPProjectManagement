<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal" %>



<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectProposal.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${projectProposalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'plannedBudget', 'error')} required">
	<label for="plannedBudget">
		<g:message code="projectProposal.plannedBudget.label" default="Planned Budget" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="plannedBudget" value="${fieldValue(bean: projectProposalInstance, field: 'plannedBudget')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'priorityOfTheProject', 'error')} required">
	<label for="priorityOfTheProject">
		<g:message code="projectProposal.priorityOfTheProject.label" default="Priority Of The Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="priorityOfTheProject" from="${projectProposalInstance.constraints.priorityOfTheProject.inList}" required="" value="${projectProposalInstance?.priorityOfTheProject}" valueMessagePrefix="projectProposal.priorityOfTheProject"/>
</div>

<br />
<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'projectDescription', 'error')} ">
	<label for="projectDescription">
		<g:message code="projectProposal.projectDescription.label" default="Project Description" />
		
	</label>
	<g:textArea name="projectDescription" cols="40" rows="5" maxlength="2000" value="${projectProposalInstance?.projectDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'requestedStartDate', 'error')} required">
	<label for="requestedStartDate">
		<g:message code="projectProposal.requestedStartDate.label" default="Requested Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="requestedStartDate" precision="day"  value="${projectProposalInstance?.requestedStartDate}"  />
</div>

<br />
<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'requestedCompletionDate', 'error')} required">
	<label for="requestedCompletionDate">
		<g:message code="projectProposal.requestedCompletionDate.label" default="Requested Completion Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="requestedCompletionDate" precision="day"  value="${projectProposalInstance?.requestedCompletionDate}"  />
</div>

<br />
<div class="fieldcontain ${hasErrors(bean: projectProposalInstance, field: 'projectType', 'error')} required">
	<label for="projectType">
		<g:message code="projectProposal.projectType.label" default="Project Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectType" name="projectType.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectType.list()}" optionKey="id" required="" value="${projectProposalInstance?.projectType?.id}" class="many-to-one"/>
    <g:link controller="projectType" action="list" >Add Project Type</g:link>
</div>

