<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementInformation" %>



<div class="fieldcontain ${hasErrors(bean: requirementInformationInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="requirementInformation.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${requirementInformationInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInformationInstance, field: 'requirementsTraceabilityMatrix', 'error')} required">
	<label for="requirementsTraceabilityMatrix">
		<g:message code="requirementInformation.requirementsTraceabilityMatrix.label" default="Requirements Traceability Matrix" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="requirementsTraceabilityMatrix" name="requirementsTraceabilityMatrix.id" from="${ProjectScopeManagement.CollectRequirements.RequirementsTraceabilityMatrix.list()}" optionKey="id" required="" value="${requirementInformationInstance?.requirementsTraceabilityMatrix?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInformationInstance, field: 'requirement', 'error')} ">
	<label for="requirement">
		<g:message code="requirementInformation.requirement.label" default="Requirement" />
		
	</label>
	<g:textField name="requirement" value="${requirementInformationInstance?.requirement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInformationInstance, field: 'priority', 'error')} ">
	<label for="priority">
		<g:message code="requirementInformation.priority.label" default="Priority" />
		
	</label>
	<g:textField name="priority" value="${requirementInformationInstance?.priority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInformationInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="requirementInformation.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${requirementInformationInstance?.category}"/>
</div>

