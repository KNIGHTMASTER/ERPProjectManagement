<%@ page import="ProjectCostManagement.CostApproval" %>



<div class="fieldcontain ${hasErrors(bean: costApprovalInstance, field: 'costManagementPlan', 'error')} required">
	<label for="costManagementPlan">
		<g:message code="costApproval.costManagementPlan.label" default="Cost Management Plan" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="costManagementPlan" name="costManagementPlan.id" from="${ProjectCostManagement.DetermineBudget.CostManagementPlan.list()}" optionKey="id" required="" value="${costApprovalInstance?.costManagementPlan?.id}" class="many-to-one"/>
</div>

<br />

<div class="fieldcontain ${hasErrors(bean: costApprovalInstance, field: 'dateCreate', 'error')} required">
	<label for="dateCreate">
		<g:message code="costApproval.dateCreate.label" default="Date Create" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCreate" precision="day"  value="${costApprovalInstance?.dateCreate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: costApprovalInstance, field: 'accepted', 'error')} ">
	<label for="accepted">
		<g:message code="costApproval.accepted.label" default="Accepted" />
		
	</label>
	<g:checkBox name="accepted" value="${costApprovalInstance?.accepted}" />
</div>

<div class="fieldcontain ${hasErrors(bean: costApprovalInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="costApproval.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${costApprovalInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costApprovalInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="costApproval.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="500" value="${costApprovalInstance?.comment}"/>
</div>

