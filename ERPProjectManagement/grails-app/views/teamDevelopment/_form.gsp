<%@ page import="ProjectHumanResourceManagement.TeamDevelopment" %>



<div class="fieldcontain ${hasErrors(bean: teamDevelopmentInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="teamDevelopment.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ProjectTimeManagement.DefineActivity.Activity.list()}" optionKey="id" required="" value="${teamDevelopmentInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamDevelopmentInstance, field: 'leader', 'error')} required">
	<label for="leader">
		<g:message code="teamDevelopment.leader.label" default="Leader" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leader" name="leader.id" from="${ProjectHumanResourceManagement.Employee.list()}" optionKey="id" required="" value="${teamDevelopmentInstance?.leader?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamDevelopmentInstance, field: 'teamMembers', 'error')} ">
	<label for="teamMembers">
		<g:message code="teamDevelopment.teamMembers.label" default="Team Members" />
		
	</label>
	<g:select name="teamMembers" from="${ProjectHumanResourceManagement.Employee.list()}" multiple="multiple" optionKey="id" size="5" value="${teamDevelopmentInstance?.teamMembers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamDevelopmentInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="teamDevelopment.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="500" value="${teamDevelopmentInstance?.description}"/>
</div>

