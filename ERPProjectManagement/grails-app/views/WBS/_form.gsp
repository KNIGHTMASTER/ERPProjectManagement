<%@ page import="ProjectScopeManagement.CreateWBS.Wbs" %>



<div class="fieldcontain ${hasErrors(bean: wbsInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="wbs.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="projectName" name="projectName.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharter.list()}" optionKey="id" required="" value="${wbsInstance?.projectName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wbsInstance, field: 'milestoneType', 'error')} required">
	<label for="milestoneType">
		<g:message code="wbs.milestoneType.label" default="Milestone Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="milestoneType" name="milestoneType.id" from="${ProjectIntegrationManagement.DevelopProjectCharter.MilestoneType.list()}" optionKey="id" required="" value="${wbsInstance?.milestoneType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wbsInstance, field: 'deliverable', 'error')} required">
	<label for="deliverable">
		<g:message code="wbs.deliverable.label" default="Deliverable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deliverable" name="deliverable.id" from="${ProjectScopeManagement.DefineScope.ProjectDeliverable.list()}" optionKey="id" required="" value="${wbsInstance?.deliverable?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wbsInstance, field: 'wbsName', 'error')} required">
	<label for="wbsName">
		<g:message code="wbs.wbsName.label" default="Wbs Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="wbsName" required="" value="${wbsInstance?.wbsName}"/>
</div>

