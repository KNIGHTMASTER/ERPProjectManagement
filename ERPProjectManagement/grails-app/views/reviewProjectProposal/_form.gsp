<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ReviewProjectProposal" %>



<div class="fieldcontain ${hasErrors(bean: reviewProjectProposalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="reviewProjectProposal.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal.list()}" optionKey="id" required="" value="${reviewProjectProposalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewProjectProposalInstance, field: 'reviewer', 'error')} ">
	<label for="reviewer">
		<g:message code="reviewProjectProposal.reviewer.label" default="Reviewer" />
		
	</label>
	<g:select id="reviewer" name="reviewer.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" value="${reviewProjectProposalInstance?.reviewer?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewProjectProposalInstance, field: 'projectStatus', 'error')} ">
	<label for="projectStatus">
		<g:message code="reviewProjectProposal.projectStatus.label" default="Project Status" />
		
	</label>
	<g:textField name="projectStatus" value="${reviewProjectProposalInstance?.projectStatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewProjectProposalInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="reviewProjectProposal.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="200000" value="${reviewProjectProposalInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewProjectProposalInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="reviewProjectProposal.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${reviewProjectProposalInstance?.acceptance}" />
</div>

