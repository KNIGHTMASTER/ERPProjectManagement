<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ChangeRequestCommunication" %>



<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="changeRequestCommunication.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${changeRequestCommunicationInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'dateRequested', 'error')} required">
	<label for="dateRequested">
		<g:message code="changeRequestCommunication.dateRequested.label" default="Date Requested" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateRequested" precision="day"  value="${changeRequestCommunicationInstance?.dateRequested}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'changeRequestor', 'error')} required">
	<label for="changeRequestor">
		<g:message code="changeRequestCommunication.changeRequestor.label" default="Change Requestor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeRequestor" name="changeRequestor.id" from="${changeRequestor}" optionKey="id" required="" value="${changeRequestCommunicationInstance?.changeRequestor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'changeCategory', 'error')} required">
	<label for="changeCategory">
		<g:message code="changeRequestCommunication.changeCategory.label" default="Change Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="changeCategory" from="${changeRequestCommunicationInstance.constraints.changeCategory.inList}" required="" value="${changeRequestCommunicationInstance?.changeCategory}" valueMessagePrefix="changeRequestCommunication.changeCategory"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'changeAffect', 'error')} required">
	<label for="changeAffect">
		<g:message code="changeRequestCommunication.changeAffect.label" default="Change Affect" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="changeAffect" from="${changeRequestCommunicationInstance.constraints.changeAffect.inList}" required="" value="${changeRequestCommunicationInstance?.changeAffect}" valueMessagePrefix="changeRequestCommunication.changeAffect"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'changeRequested', 'error')} ">
	<label for="changeRequested">
		<g:message code="changeRequestCommunication.changeRequested.label" default="Change Requested" />
		
	</label>
	<g:textArea name="changeRequested" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.changeRequested}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'reasonForChange', 'error')} ">
	<label for="reasonForChange">
		<g:message code="changeRequestCommunication.reasonForChange.label" default="Reason For Change" />
		
	</label>
	<g:textArea name="reasonForChange" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.reasonForChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'alternativeConsidered', 'error')} ">
	<label for="alternativeConsidered">
		<g:message code="changeRequestCommunication.alternativeConsidered.label" default="Alternative Considered" />
		
	</label>
	<g:textArea name="alternativeConsidered" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.alternativeConsidered}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'requiredTechnicalChange', 'error')} ">
	<label for="requiredTechnicalChange">
		<g:message code="changeRequestCommunication.requiredTechnicalChange.label" default="Required Technical Change" />
		
	</label>
	<g:textArea name="requiredTechnicalChange" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.requiredTechnicalChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'riskForTheChange', 'error')} ">
	<label for="riskForTheChange">
		<g:message code="changeRequestCommunication.riskForTheChange.label" default="Risk For The Change" />
		
	</label>
	<g:textArea name="riskForTheChange" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.riskForTheChange}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'estimatedCostNeeded', 'error')} required">
	<label for="estimatedCostNeeded">
		<g:message code="changeRequestCommunication.estimatedCostNeeded.label" default="Estimated Cost Needed" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="estimatedCostNeeded" type="number" value="${changeRequestCommunicationInstance.estimatedCostNeeded}" required=""/>
</div>
<br>
<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'estimatedResourceNeeded', 'error')} ">
	<label for="estimatedResourceNeeded">
		<g:message code="changeRequestCommunication.estimatedResourceNeeded.label" default="Estimated Resource Needed" />
		
	</label>
	<g:textArea name="estimatedResourceNeeded" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.estimatedResourceNeeded}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'implicationOfQuality', 'error')} ">
	<label for="implicationOfQuality">
		<g:message code="changeRequestCommunication.implicationOfQuality.label" default="Implication Of Quality" />
		
	</label>
	<g:textArea name="implicationOfQuality" cols="40" rows="5" maxlength="1000" value="${changeRequestCommunicationInstance?.implicationOfQuality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeRequestCommunicationInstance, field: 'approvals', 'error')} ">
	<label for="approvals">
		<g:message code="changeRequestCommunication.approvals.label" default="Approvals" />
		
	</label>
	<g:select name="approvals" from="${ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeBoardApproval.list()}" multiple="multiple" optionKey="id" size="5" value="${changeRequestCommunicationInstance?.approvals*.id}" class="many-to-many"/>
</div>

