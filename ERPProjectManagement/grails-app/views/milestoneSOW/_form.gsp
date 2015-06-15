<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.MilestoneSOW" %>



<div class="fieldcontain ${hasErrors(bean: milestoneSOWInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="milestoneSOW.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${milestoneSOWInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestoneSOWInstance, field: 'milestoneName', 'error')} required">
	<label for="milestoneName">
		<g:message code="milestoneSOW.milestoneName.label" default="Milestone Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="milestoneName" required="" value="${milestoneSOWInstance?.milestoneName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestoneSOWInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="milestoneSOW.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dueDate" precision="day"  value="${milestoneSOWInstance?.dueDate}"  />
</div>

