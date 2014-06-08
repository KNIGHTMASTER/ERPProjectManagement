<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharterApproval" %>



<div class="fieldcontain ${hasErrors(bean: projectCharterApprovalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectCharterApproval.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${proposal}" optionKey="id" required="" value="${projectCharterApprovalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterApprovalInstance, field: 'projectCharter', 'error')} required">
    <label for="projectCharter">
        <g:message code="projectCharterApproval.projectCharter.label" default="Project Charter" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="projectCharter" name="projectCharter.id" from="${charter}" optionKey="id" required="" value="${projectCharterApprovalInstance?.projectCharter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterApprovalInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="projectCharterApproval.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${stakeholder}" optionKey="id" required="" value="${projectCharterApprovalInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterApprovalInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="projectCharterApproval.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${projectCharterApprovalInstance?.acceptance}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectCharterApprovalInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="projectCharterApproval.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="2000" value="${projectCharterApprovalInstance?.comments}"/>
</div>

