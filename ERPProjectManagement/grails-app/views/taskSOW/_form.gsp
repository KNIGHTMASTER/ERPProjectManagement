<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.TaskSOW" %>



<div class="fieldcontain ${hasErrors(bean: taskSOWInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="taskSOW.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${taskSOWInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskSOWInstance, field: 'workRequirement', 'error')} required">
	<label for="workRequirement">
		<g:message code="taskSOW.workRequirement.label" default="Work Requirement" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workRequirement" name="workRequirement.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.WorkRequirements.list()}" optionKey="id" required="" value="${taskSOWInstance?.workRequirement?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskSOWInstance, field: 'task', 'error')} ">
	<label for="task">
		<g:message code="taskSOW.task.label" default="Task" />
		
	</label>
	<g:textField name="task" value="${taskSOWInstance?.task}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskSOWInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="taskSOW.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${taskSOWInstance?.description}"/>
</div>

