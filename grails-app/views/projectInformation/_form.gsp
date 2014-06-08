<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectInformation" %>



<div class="fieldcontain ${hasErrors(bean: projectInformationInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectInformation.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal.list()}" optionKey="id" required="" value="${projectInformationInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInformationInstance, field: 'projectStatus', 'error')} ">
	<label for="projectStatus">
		<g:message code="projectInformation.projectStatus.label" default="Project Status" />
		
	</label>
	<g:textField name="projectStatus" value="${projectInformationInstance?.projectStatus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInformationInstance, field: 'acceptance', 'error')} ">
	<label for="acceptance">
		<g:message code="projectInformation.acceptance.label" default="Acceptance" />
		
	</label>
	<g:checkBox name="acceptance" value="${projectInformationInstance?.acceptance}" />
</div>

