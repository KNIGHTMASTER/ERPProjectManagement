<%@ page import="ProjectScopeManagement.VerifyScope.AcceptedDeliverable" %>



<div class="fieldcontain ${hasErrors(bean: acceptedDeliverableInstance, field: 'deliverable', 'error')} required">
	<label for="deliverable">
		<g:message code="acceptedDeliverable.deliverable.label" default="Deliverable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deliverable" name="deliverable.id" from="${ProjectScopeManagement.DefineScope.ProjectDeliverable.list()}" optionKey="id" required="" value="${acceptedDeliverableInstance?.deliverable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: acceptedDeliverableInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="acceptedDeliverable.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${acceptedDeliverableInstance?.acceptance}" />
</div>

