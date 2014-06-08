<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRoles" %>



<div class="fieldcontain ${hasErrors(bean: stakeholderRolesInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="stakeholderRoles.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${namaProyek}" optionKey="id" required="" value="${stakeholderRolesInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRolesInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="stakeholderRoles.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="role" required="" value="${stakeholderRolesInstance?.role}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stakeholderRolesInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="stakeholderRoles.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${stakeholderRolesInstance?.description}"/>
</div>

