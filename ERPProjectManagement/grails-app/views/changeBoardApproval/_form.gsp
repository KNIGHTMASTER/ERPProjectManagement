<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeBoardApproval" %>



<div class="fieldcontain ${hasErrors(bean: changeBoardApprovalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="changeBoardApproval.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${changeBoardApprovalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeBoardApprovalInstance, field: 'changeRequest', 'error')} required">
	<label for="changeRequest">
		<g:message code="changeBoardApproval.changeRequest.label" default="Change Request" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeRequest" name="changeRequest.id" from="${ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeRequest.list()}" optionKey="id" required="" value="${changeBoardApprovalInstance?.changeRequest?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeBoardApprovalInstance, field: 'peopleWhoApprove', 'error')} required">
	<label for="peopleWhoApprove">
		<g:message code="changeBoardApproval.peopleWhoApprove.label" default="People Who Approve" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="peopleWhoApprove" name="peopleWhoApprove.id" from="${ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard.list()}" optionKey="id" required="" value="${changeBoardApprovalInstance?.peopleWhoApprove?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeBoardApprovalInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="changeBoardApproval.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${changeBoardApprovalInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: changeBoardApprovalInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="changeBoardApproval.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${changeBoardApprovalInstance?.comments}"/>
</div>

