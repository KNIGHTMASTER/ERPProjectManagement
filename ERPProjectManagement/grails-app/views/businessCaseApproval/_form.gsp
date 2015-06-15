<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCaseApproval" %>



<div class="fieldcontain ${hasErrors(bean: businessCaseApprovalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="businessCaseApproval.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" optionKey="id" required="" value="${businessCaseApprovalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseApprovalInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="businessCaseApproval.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${businessCaseApprovalInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseApprovalInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="businessCaseApproval.approval.label" default="Approval" />
		
	</label>
	<g:checkBox name="approval" value="${businessCaseApprovalInstance?.approval}" />
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseApprovalInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="businessCaseApproval.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="2000" value="${businessCaseApprovalInstance?.comments}"/>
</div>

