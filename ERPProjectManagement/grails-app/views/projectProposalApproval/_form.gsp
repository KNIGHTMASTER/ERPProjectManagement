<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposalApproval" %>



<div class="fieldcontain ${hasErrors(bean: projectProposalApprovalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectProposalApproval.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal.list()}" optionKey="id" required="" value="${projectProposalApprovalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectProposalApprovalInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="projectProposalApproval.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${projectProposalApprovalInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectProposalApprovalInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="projectProposalApproval.approval.label" default="Approval" />
		
	</label>
	<g:checkBox name="approval" value="${projectProposalApprovalInstance?.approval}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectProposalApprovalInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="projectProposalApproval.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="2000" value="${projectProposalApprovalInstance?.comments}"/>
</div>

