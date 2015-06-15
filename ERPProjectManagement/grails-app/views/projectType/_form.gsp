<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectType" %>



<div class="fieldcontain ${hasErrors(bean: projectTypeInstance, field: 'projectType', 'error')} required">
	<label for="projectType">
		<g:message code="projectType.projectType.label" default="Project Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectType" required="" value="${projectTypeInstance?.projectType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="projectType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${projectTypeInstance?.description}"/>
</div>

