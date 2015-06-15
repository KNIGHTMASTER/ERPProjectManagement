<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsTraceabilityMatrix" %>



<div class="fieldcontain ${hasErrors(bean: requirementsTraceabilityMatrixInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="requirementsTraceabilityMatrix.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${requirementsTraceabilityMatrixInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsTraceabilityMatrixInstance, field: 'requirementInformation', 'error')} ">
	<label for="requirementInformation">
		<g:message code="requirementsTraceabilityMatrix.requirementInformation.label" default="Requirement Information" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${requirementsTraceabilityMatrixInstance?.requirementInformation?}" var="r">
    <li><g:link controller="requirementInformation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requirementInformation" action="create" params="['requirementsTraceabilityMatrix.id': requirementsTraceabilityMatrixInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requirementInformation.label', default: 'RequirementInformation')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: requirementsTraceabilityMatrixInstance, field: 'relationshipTraceability', 'error')} ">
	<label for="relationshipTraceability">
		<g:message code="requirementsTraceabilityMatrix.relationshipTraceability.label" default="Relationship Traceability" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${requirementsTraceabilityMatrixInstance?.relationshipTraceability?}" var="r">
    <li><g:link controller="relationshipTraceability" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="relationshipTraceability" action="create" params="['requirementsTraceabilityMatrix.id': requirementsTraceabilityMatrixInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability')])}</g:link>
</li>
</ul>

</div>

