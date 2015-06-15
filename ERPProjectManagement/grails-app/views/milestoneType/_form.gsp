<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.MilestoneType" %>



<div class="fieldcontain ${hasErrors(bean: milestoneTypeInstance, field: 'milestone', 'error')} ">
	<label for="milestone">
		<g:message code="milestoneType.milestone.label" default="Milestone" />
		
	</label>
	<g:textField name="milestone" value="${milestoneTypeInstance?.milestone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: milestoneTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="milestoneType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2000" value="${milestoneTypeInstance?.description}"/>
</div>

