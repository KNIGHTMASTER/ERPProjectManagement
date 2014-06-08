<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWorkApproval" %>



<div class="fieldcontain ${hasErrors(bean: statementOfWorkApprovalInstance, field: 'statementOfWork', 'error')} required">
	<label for="statementOfWork">
		<g:message code="statementOfWorkApproval.statementOfWork.label" default="Statement Of Work" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="statementOfWork" name="statementOfWork.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${statementOfWorkApprovalInstance?.statementOfWork?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkApprovalInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="statementOfWorkApproval.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${statementOfWorkApprovalInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkApprovalInstance, field: 'approval', 'error')} ">
	<label for="approval">
		<g:message code="statementOfWorkApproval.approval.label" default="Approval" />
		
	</label>
	<g:checkBox name="approval" value="${statementOfWorkApprovalInstance?.approval}" />
</div>

<div class="fieldcontain ${hasErrors(bean: statementOfWorkApprovalInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="statementOfWorkApproval.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="2000" value="${statementOfWorkApprovalInstance?.comments}"/>
</div>

