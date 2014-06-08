<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.ManageTeamMemberAssignedToProject" %>



<div class="fieldcontain ${hasErrors(bean: manageTeamMemberAssignedToProjectInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="manageTeamMemberAssignedToProject.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${projectName}" optionKey="id" required="" value="${manageTeamMemberAssignedToProjectInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageTeamMemberAssignedToProjectInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="manageTeamMemberAssignedToProject.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${aktivitas}" optionKey="id" required="" value="${manageTeamMemberAssignedToProjectInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageTeamMemberAssignedToProjectInstance, field: 'leader', 'error')} required">
	<label for="leader">
		<g:message code="manageTeamMemberAssignedToProject.leader.label" default="Leader" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leader" name="leader.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${manageTeamMemberAssignedToProjectInstance?.leader?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageTeamMemberAssignedToProjectInstance, field: 'teamMembers', 'error')} ">
	<label for="teamMembers">
		<g:message code="manageTeamMemberAssignedToProject.teamMembers.label" default="Team Members" />
		
	</label>
	<g:select name="teamMembers" from="${ProjectHumanResourceManagement.Employee.list()}" multiple="multiple" optionKey="id" size="20" value="${manageTeamMemberAssignedToProjectInstance?.teamMembers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: manageTeamMemberAssignedToProjectInstance, field: 'assigned', 'error')} ">
	<label for="assigned">
		<g:message code="manageTeamMemberAssignedToProject.assigned.label" default="Assigned" />
		
	</label>
	<g:checkBox name="assigned" value="${manageTeamMemberAssignedToProjectInstance?.assigned}" />
</div>

<div class="fieldcontain ${hasErrors(bean: manageTeamMemberAssignedToProjectInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="manageTeamMemberAssignedToProject.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${manageTeamMemberAssignedToProjectInstance?.description}"/>
</div>

