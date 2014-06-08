<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeRequest" %>



<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="changeRequest.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${changeRequestInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'dateRequested', 'error')} required">
	<label for="dateRequested">
		<g:message code="changeRequest.dateRequested.label" default="Date Requested" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateRequested" precision="day"  value="${changeRequestInstance?.dateRequested}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'changeRequestor', 'error')} required">
	<label for="changeRequestor">
		<g:message code="changeRequest.changeRequestor.label" default="Change Requestor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeRequestor" name="changeRequestor.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${changeRequestInstance?.changeRequestor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'changeCategory', 'error')} required">
	<label for="changeCategory">
		<g:message code="changeRequest.changeCategory.label" default="Change Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="changeCategory" from="${changeRequestInstance.constraints.changeCategory.inList}" required="" value="${changeRequestInstance?.changeCategory}" valueMessagePrefix="changeRequest.changeCategory"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'changeAffect', 'error')} required">
	<label for="changeAffect">
		<g:message code="changeRequest.changeAffect.label" default="Change Affect" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="changeAffect" from="${changeRequestInstance.constraints.changeAffect.inList}" required="" value="${changeRequestInstance?.changeAffect}" valueMessagePrefix="changeRequest.changeAffect"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'changeRequested', 'error')} ">
	<label for="changeRequested">
		<g:message code="changeRequest.changeRequested.label" default="Change Requested" />
		
	</label>
	<g:textArea name="changeRequested" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.changeRequested}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'reasonForChange', 'error')} ">
	<label for="reasonForChange">
		<g:message code="changeRequest.reasonForChange.label" default="Reason For Change" />
		
	</label>
	<g:textArea name="reasonForChange" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.reasonForChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'alternativeConsidered', 'error')} ">
	<label for="alternativeConsidered">
		<g:message code="changeRequest.alternativeConsidered.label" default="Alternative Considered" />
		
	</label>
	<g:textArea name="alternativeConsidered" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.alternativeConsidered}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'requiredTechnicalChange', 'error')} ">
	<label for="requiredTechnicalChange">
		<g:message code="changeRequest.requiredTechnicalChange.label" default="Required Technical Change" />
		
	</label>
	<g:textArea name="requiredTechnicalChange" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.requiredTechnicalChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'riskForTheChange', 'error')} ">
	<label for="riskForTheChange">
		<g:message code="changeRequest.riskForTheChange.label" default="Risk For The Change" />
		
	</label>
	<g:textArea name="riskForTheChange" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.riskForTheChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'estimatedCostNeeded', 'error')} required">
	<label for="estimatedCostNeeded">
		<g:message code="changeRequest.estimatedCostNeeded.label" default="Estimated Cost Needed" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimatedCostNeeded" type="number" value="${changeRequestInstance.estimatedCostNeeded}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'estimatedResourceNeeded', 'error')} ">
	<label for="estimatedResourceNeeded">
		<g:message code="changeRequest.estimatedResourceNeeded.label" default="Estimated Resource Needed" />
		
	</label>
	<g:textArea name="estimatedResourceNeeded" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.estimatedResourceNeeded}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'implicationOfQuality', 'error')} ">
	<label for="implicationOfQuality">
		<g:message code="changeRequest.implicationOfQuality.label" default="Implication Of Quality" />
		
	</label>
	<g:textArea name="implicationOfQuality" cols="40" rows="5" maxlength="1000" value="${changeRequestInstance?.implicationOfQuality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestInstance, field: 'approvals', 'error')} ">
	<label for="approvals">
		<g:message code="changeRequest.approvals.label" default="Approvals" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${changeRequestInstance?.approvals?}" var="a">
    <li><g:link controller="changeBoardApproval" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="changeBoardApproval" action="create" params="['changeRequest.id': changeRequestInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval')])}</g:link>
</li>
</ul>

</div>

