<%@ page import="ProjectScopeManagement.CollectRequirements.RelationshipTraceability" %>



<div class="fieldcontain ${hasErrors(bean: relationshipTraceabilityInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="relationshipTraceability.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${relationshipTraceabilityInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relationshipTraceabilityInstance, field: 'requirementsTraceabilityMatrix', 'error')} required">
	<label for="requirementsTraceabilityMatrix">
		<g:message code="relationshipTraceability.requirementsTraceabilityMatrix.label" default="Requirements Traceability Matrix" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="requirementsTraceabilityMatrix" name="requirementsTraceabilityMatrix.id" from="${ProjectScopeManagement.CollectRequirements.RequirementsTraceabilityMatrix.list()}" optionKey="id" required="" value="${relationshipTraceabilityInstance?.requirementsTraceabilityMatrix?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relationshipTraceabilityInstance, field: 'relatesToObjectives', 'error')} ">
	<label for="relatesToObjectives">
		<g:message code="relationshipTraceability.relatesToObjectives.label" default="Relates To Objectives" />
		
	</label>
	<g:textField name="relatesToObjectives" value="${relationshipTraceabilityInstance?.relatesToObjectives}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relationshipTraceabilityInstance, field: 'manifestInWBSDeliverable', 'error')} ">
	<label for="manifestInWBSDeliverable">
		<g:message code="relationshipTraceability.manifestInWBSDeliverable.label" default="Manifest In WBSD eliverable" />
		
	</label>
	<g:textField name="manifestInWBSDeliverable" value="${relationshipTraceabilityInstance?.manifestInWBSDeliverable}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relationshipTraceabilityInstance, field: 'verification', 'error')} ">
	<label for="verification">
		<g:message code="relationshipTraceability.verification.label" default="Verification" />
		
	</label>
	<g:textField name="verification" value="${relationshipTraceabilityInstance?.verification}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: relationshipTraceabilityInstance, field: 'validation', 'error')} ">
	<label for="validation">
		<g:message code="relationshipTraceability.validation.label" default="Validation" />
		
	</label>
	<g:textField name="validation" value="${relationshipTraceabilityInstance?.validation}"/>
</div>

