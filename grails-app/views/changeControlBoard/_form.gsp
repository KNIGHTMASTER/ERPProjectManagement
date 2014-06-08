<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard" %>



<div class="fieldcontain ${hasErrors(bean: changeControlBoardInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="changeControlBoard.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeManagementPlan.list()}" optionKey="id" required="" value="${changeControlBoardInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeControlBoardInstance, field: 'stakeholder', 'error')} required">
	<label for="stakeholder">
		<g:message code="changeControlBoard.stakeholder.label" default="Stakeholder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stakeholder" name="stakeholder.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${changeControlBoardInstance?.stakeholder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeControlBoardInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="changeControlBoard.role.label" default="Role" />
		
	</label>
	<g:textField name="role" value="${changeControlBoardInstance?.role}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeControlBoardInstance, field: 'responsibility', 'error')} ">
	<label for="responsibility">
		<g:message code="changeControlBoard.responsibility.label" default="Responsibility" />
		
	</label>
	<g:textField name="responsibility" value="${changeControlBoardInstance?.responsibility}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: changeControlBoardInstance, field: 'authority', 'error')} ">
	<label for="authority">
		<g:message code="changeControlBoard.authority.label" default="Authority" />
		
	</label>
	<g:textField name="authority" value="${changeControlBoardInstance?.authority}"/>
</div>

