
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.Milestones" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'milestones.label', default: 'Milestones')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-milestones" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-milestones" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list milestones">
			
				<g:if test="${milestonesInstance?.idMilestone}">
				<li class="fieldcontain">
					<span id="idMilestone-label" class="property-label"><g:message code="milestones.idMilestone.label" default="Id Milestone" /></span>
					
						<span class="property-value" aria-labelledby="idMilestone-label"><g:fieldValue bean="${milestonesInstance}" field="idMilestone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.milestoneName}">
				<li class="fieldcontain">
					<span id="milestoneName-label" class="property-label"><g:message code="milestones.milestoneName.label" default="Milestone Name" /></span>
					
						<span class="property-value" aria-labelledby="milestoneName-label"><g:fieldValue bean="${milestonesInstance}" field="milestoneName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="milestones.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:fieldValue bean="${milestonesInstance}" field="parent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="milestones.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${milestonesInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="milestones.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${milestonesInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="milestones.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${milestonesInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="milestones.activity.label" default="Activity" /></span>
					
						<g:each in="${milestonesInstance.activity}" var="a">
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.costManagementPlans}">
				<li class="fieldcontain">
					<span id="costManagementPlans-label" class="property-label"><g:message code="milestones.costManagementPlans.label" default="Cost Management Plans" /></span>
					
						<g:each in="${milestonesInstance.costManagementPlans}" var="c">
						<span class="property-value" aria-labelledby="costManagementPlans-label"><g:link controller="costManagementPlan" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${milestonesInstance?.idProject}">
				<li class="fieldcontain">
					<span id="idProject-label" class="property-label"><g:message code="milestones.idProject.label" default="Id Project" /></span>
					
						<span class="property-value" aria-labelledby="idProject-label"><g:link controller="statementOfWork" action="show" id="${milestonesInstance?.idProject?.id}">${milestonesInstance?.idProject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${milestonesInstance?.id}" />
					<g:link class="edit" action="edit" id="${milestonesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
