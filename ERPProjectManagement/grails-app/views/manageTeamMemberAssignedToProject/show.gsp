
<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.ManageTeamMemberAssignedToProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manageTeamMemberAssignedToProject.label', default: 'ManageTeamMemberAssignedToProject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-manageTeamMemberAssignedToProject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-manageTeamMemberAssignedToProject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list manageTeamMemberAssignedToProject">
			
				<g:if test="${manageTeamMemberAssignedToProjectInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="manageTeamMemberAssignedToProject.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${manageTeamMemberAssignedToProjectInstance?.projectName?.id}">${manageTeamMemberAssignedToProjectInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageTeamMemberAssignedToProjectInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="manageTeamMemberAssignedToProject.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${manageTeamMemberAssignedToProjectInstance?.activity?.id}">${manageTeamMemberAssignedToProjectInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageTeamMemberAssignedToProjectInstance?.leader}">
				<li class="fieldcontain">
					<span id="leader-label" class="property-label"><g:message code="manageTeamMemberAssignedToProject.leader.label" default="Leader" /></span>
					
						<span class="property-value" aria-labelledby="leader-label"><g:link controller="employee" action="show" id="${manageTeamMemberAssignedToProjectInstance?.leader?.id}">${manageTeamMemberAssignedToProjectInstance?.leader?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageTeamMemberAssignedToProjectInstance?.teamMembers}">
				<li class="fieldcontain">
					<span id="teamMembers-label" class="property-label"><g:message code="manageTeamMemberAssignedToProject.teamMembers.label" default="Team Members" /></span>
					
						<g:each in="${manageTeamMemberAssignedToProjectInstance.teamMembers}" var="t">
						<span class="property-value" aria-labelledby="teamMembers-label"><g:link controller="employee" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${manageTeamMemberAssignedToProjectInstance?.assigned}">
				<li class="fieldcontain">
					<span id="assigned-label" class="property-label"><g:message code="manageTeamMemberAssignedToProject.assigned.label" default="Assigned" /></span>
					
						<span class="property-value" aria-labelledby="assigned-label"><g:formatBoolean boolean="${manageTeamMemberAssignedToProjectInstance?.assigned}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageTeamMemberAssignedToProjectInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="manageTeamMemberAssignedToProject.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${manageTeamMemberAssignedToProjectInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${manageTeamMemberAssignedToProjectInstance?.id}" />
					<g:link class="edit" action="edit" id="${manageTeamMemberAssignedToProjectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
