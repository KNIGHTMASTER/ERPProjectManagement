<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCaseAnalysisTeam" %>



<div class="fieldcontain ${hasErrors(bean: businessCaseAnalysisTeamInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="businessCaseAnalysisTeam.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.BusinessCase.list()}" optionKey="id" required="" value="${businessCaseAnalysisTeamInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseAnalysisTeamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="businessCaseAnalysisTeam.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="name" name="name.id" from="${ProjectCommunicationManagement.IdentifyStakeholders.StakeholderRegister.list()}" optionKey="id" required="" value="${businessCaseAnalysisTeamInstance?.name?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseAnalysisTeamInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="businessCaseAnalysisTeam.role.label" default="Role" />
		
	</label>
	<g:textField name="role" value="${businessCaseAnalysisTeamInstance?.role}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: businessCaseAnalysisTeamInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="businessCaseAnalysisTeam.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${businessCaseAnalysisTeamInstance?.description}"/>
</div>

