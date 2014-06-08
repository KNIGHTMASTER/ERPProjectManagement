<%@ page import="ProjectCommunicationManagement.PlanCommunications.ProjectStakeholder" %>



<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectStakeholder.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWork.list()}" optionKey="id" required="" value="${projectStakeholderInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="projectStakeholder.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${ProjectCommunicationManagement.PlanCommunications.StakeholderRoles.list()}" optionKey="id" required="" value="${projectStakeholderInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="projectStakeholder.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${projectStakeholderInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="projectStakeholder.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${projectStakeholderInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'department', 'error')} ">
	<label for="department">
		<g:message code="projectStakeholder.department.label" default="Department" />
		
	</label>
	<g:textField name="department" value="${projectStakeholderInstance?.department}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="projectStakeholder.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${projectStakeholderInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectStakeholderInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="projectStakeholder.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${projectStakeholderInstance?.phone}"/>
</div>

