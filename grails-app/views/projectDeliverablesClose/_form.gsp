<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.ProjectDeliverablesClose" %>



<div class="fieldcontain ${hasErrors(bean: projectDeliverablesCloseInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectDeliverablesClose.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${projectDeliverablesCloseInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectDeliverablesCloseInstance, field: 'milestone', 'error')} required">
	<label for="milestone">
		<g:message code="projectDeliverablesClose.milestone.label" default="Milestone" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="milestone" name="milestone.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" optionKey="id" required="" value="${projectDeliverablesCloseInstance?.milestone?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectDeliverablesCloseInstance, field: 'plannedDeliverable', 'error')} required">
	<label for="plannedDeliverable">
		<g:message code="projectDeliverablesClose.plannedDeliverable.label" default="Planned Deliverable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="plannedDeliverable" name="plannedDeliverable.id" from="${ProjectScopeManagement.DefineScope.ProjectDeliverable.list()}" optionKey="id" required="" value="${projectDeliverablesCloseInstance?.plannedDeliverable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectDeliverablesCloseInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="projectDeliverablesClose.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${projectDeliverablesCloseInstance.constraints.status.inList}" required="" value="${projectDeliverablesCloseInstance?.status}" valueMessagePrefix="projectDeliverablesClose.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectDeliverablesCloseInstance, field: 'projectRecord', 'error')} required">
	<label for="projectRecord">
		<g:message code="projectDeliverablesClose.projectRecord.label" default="Project Record" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectRecord" name="projectRecord.id" from="${ProjectIntegrationManagement.CloseProjectOrPhase.ProjectRecord.list()}" optionKey="id" required="" value="${projectDeliverablesCloseInstance?.projectRecord?.id}" class="many-to-one"/>
</div>

