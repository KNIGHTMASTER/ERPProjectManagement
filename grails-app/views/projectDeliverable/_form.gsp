<%@ page import="ProjectScopeManagement.DefineScope.ProjectDeliverable" %>



<div class="fieldcontain ${hasErrors(bean: projectDeliverableInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="projectDeliverable.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${projectDeliverableInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectDeliverableInstance, field: 'milestones', 'error')} required">
	<label for="milestones">
		<g:message code="projectDeliverable.milestones.label" default="Milestones" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="milestones" name="milestones.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.Milestones.list()}" optionKey="id" required="" value="${projectDeliverableInstance?.milestones?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectDeliverableInstance, field: 'deliverable', 'error')} ">
	<label for="deliverable">
		<g:message code="projectDeliverable.deliverable.label" default="Deliverable" />
		
	</label>
	<g:textField name="deliverable" value="${projectDeliverableInstance?.deliverable}"/>
</div>

