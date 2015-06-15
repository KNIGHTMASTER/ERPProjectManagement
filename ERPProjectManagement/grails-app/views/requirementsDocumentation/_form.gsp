<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsDocumentation" %>



<div class="fieldcontain ${hasErrors(bean: requirementsDocumentationInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="requirementsDocumentation.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${requirementsDocumentationInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsDocumentationInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="requirementsDocumentation.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${requirementsDocumentationInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsDocumentationInstance, field: 'requirement', 'error')} ">
	<label for="requirement">
		<g:message code="requirementsDocumentation.requirement.label" default="Requirement" />
		
	</label>
	<g:textArea name="requirement" cols="40" rows="5" maxlength="1000" value="${requirementsDocumentationInstance?.requirement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsDocumentationInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="requirementsDocumentation.category.label" default="Category" />
		
	</label>
	<g:textArea name="category" cols="40" rows="5" maxlength="1000" value="${requirementsDocumentationInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsDocumentationInstance, field: 'priority', 'error')} ">
	<label for="priority">
		<g:message code="requirementsDocumentation.priority.label" default="Priority" />
		
	</label>
	<g:textArea name="priority" cols="40" rows="5" maxlength="1000" value="${requirementsDocumentationInstance?.priority}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementsDocumentationInstance, field: 'acceptanceCriteria', 'error')} ">
	<label for="acceptanceCriteria">
		<g:message code="requirementsDocumentation.acceptanceCriteria.label" default="Acceptance Criteria" />
		
	</label>
	<g:textArea name="acceptanceCriteria" cols="40" rows="5" maxlength="1000" value="${requirementsDocumentationInstance?.acceptanceCriteria}"/>
</div>

