<%@ page import="ProjectScopeManagement.VerifyScope.Inspection" %>



<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="inspection.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${inspectionInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'deliverable', 'error')} required">
	<label for="deliverable">
		<g:message code="inspection.deliverable.label" default="Deliverable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deliverable" name="deliverable.id" from="${ProjectScopeManagement.DefineScope.ProjectDeliverable.list()}" optionKey="id" required="" value="${inspectionInstance?.deliverable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'decision', 'error')} ">
	<label for="decision">
		<g:message code="inspection.decision.label" default="Decision" />
		
	</label>
	<g:select name="decision" from="${inspectionInstance.constraints.decision.inList}" value="${inspectionInstance?.decision}" valueMessagePrefix="inspection.decision" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inspectionInstance, field: 'realization', 'error')} ">
	<label for="realization">
		<g:message code="inspection.realization.label" default="Realization" />
		
	</label>
	<g:textArea name="realization" cols="40" rows="5" maxlength="1000" value="${inspectionInstance?.realization}"/>
</div>

