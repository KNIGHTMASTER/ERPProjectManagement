<%@ page import="ProjectProcurementManagement.PlanProcurement.Approval" %>



<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="approval.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${approvalInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'dateApproval', 'error')} required">
	<label for="dateApproval">
		<g:message code="approval.dateApproval.label" default="Date Approval" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateApproval" precision="day"  value="${approvalInstance?.dateApproval}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'materialName', 'error')} required">
	<label for="materialName">
		<g:message code="approval.materialName.label" default="Material Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materialName" name="materialName.id" from="${ProjectProcurementManagement.PlanProcurement.RequirementProcurement.list()}" optionKey="id" required="" value="${approvalInstance?.materialName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'stakeholderRegister', 'error')} required">
	<label for="stakeholderRegister">
		<g:message code="approval.stakeholderRegister.label" default="Stakeholder Register" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholderRegister" name="stakeholderRegister.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${approvalInstance?.stakeholderRegister?.id}" class="many-to-one"/>
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'accepted', 'error')} ">
	<label for="accepted">
		<g:message code="approval.accepted.label" default="Accepted" />
		
	</label>
	<g:checkBox name="accepted" value="${approvalInstance?.accepted}" />
</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="approval.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="500" value="${approvalInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: approvalInstance, field: 'bidderSelected', 'error')} ">
	<label for="bidderSelected">
		<g:message code="approval.bidderSelected.label" default="Bidder Selected" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${approvalInstance?.bidderSelected?}" var="b">
    <li><g:link controller="bidderSelected" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bidderSelected" action="create" params="['approval.id': approvalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bidderSelected.label', default: 'BidderSelected')])}</g:link>
</li>
</ul>

</div>

