<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.ProjectStatus" %>



<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectStatus.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${projectStatusInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'workPerformanceInformation', 'error')} required">
	<label for="workPerformanceInformation">
		<g:message code="projectStatus.workPerformanceInformation.label" default="Work Performance Information" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workPerformanceInformation" name="workPerformanceInformation.id" from="${ProjectIntegrationManagement.DirectAndManageProjectExecution.WorkPerformanceInformation.list()}" optionKey="id" required="" value="${projectStatusInstance?.workPerformanceInformation?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'item', 'error')} ">
	<label for="item">
		<g:message code="projectStatus.item.label" default="Item" />
		
	</label>
	<g:textField name="item" value="${projectStatusInstance?.item}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'bad', 'error')} required">
	<label for="bad">
		<g:message code="projectStatus.bad.label" default="Bad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bad" type="number" value="${projectStatusInstance.bad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'good', 'error')} required">
	<label for="good">
		<g:message code="projectStatus.good.label" default="Good" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="good" type="number" value="${projectStatusInstance.good}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStatusInstance, field: 'excellent', 'error')} required">
	<label for="excellent">
		<g:message code="projectStatus.excellent.label" default="Excellent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="excellent" type="number" value="${projectStatusInstance.excellent}" required=""/>
</div>

