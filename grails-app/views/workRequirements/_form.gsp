<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.WorkRequirements" %>



<div class="fieldcontain ${hasErrors(bean: workRequirementsInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="workRequirements.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${workRequirementsInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workRequirementsInstance, field: 'workPackage', 'error')} ">
	<label for="workPackage">
		<g:message code="workRequirements.workPackage.label" default="Work Package" />
		
	</label>
	<g:textField name="workPackage" value="${workRequirementsInstance?.workPackage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workRequirementsInstance, field: 'start', 'error')} required">
	<label for="start">
		<g:message code="workRequirements.start.label" default="Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="start" precision="day"  value="${workRequirementsInstance?.start}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: workRequirementsInstance, field: 'finish', 'error')} required">
	<label for="finish">
		<g:message code="workRequirements.finish.label" default="Finish" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="finish" precision="day"  value="${workRequirementsInstance?.finish}"  />
</div>

