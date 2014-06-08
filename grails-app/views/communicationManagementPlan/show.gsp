
<%@ page import="ProjectCommunicationManagement.PlanCommunications.CommunicationManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationManagementPlan.label', default: 'CommunicationManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-communicationManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-communicationManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list communicationManagementPlan">
			
				<g:if test="${communicationManagementPlanInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="communicationManagementPlan.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${communicationManagementPlanInstance?.projectName?.id}">${communicationManagementPlanInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.introduction}">
				<li class="fieldcontain">
					<span id="introduction-label" class="property-label"><g:message code="communicationManagementPlan.introduction.label" default="Introduction" /></span>
					
						<span class="property-value" aria-labelledby="introduction-label">${communicationManagementPlanInstance.introduction}</span>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.communicationManagementApproach}">
				<li class="fieldcontain">
					<span id="communicationManagementApproach-label" class="property-label"><g:message code="communicationManagementPlan.communicationManagementApproach.label" default="Communication Management Approach" /></span>
					
						<span class="property-value" aria-labelledby="communicationManagementApproach-label">${communicationManagementPlanInstance.communicationManagementApproach}</span>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.communicationManagementConstraints}">
				<li class="fieldcontain">
					<span id="communicationManagementConstraints-label" class="property-label"><g:message code="communicationManagementPlan.communicationManagementConstraints.label" default="Communication Management Constraints" /></span>
					
						<span class="property-value" aria-labelledby="communicationManagementConstraints-label">${communicationManagementPlanInstance.communicationManagementConstraints}</span>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.stakeholderCommunicationRequirements}">
				<li class="fieldcontain">
					<span id="stakeholderCommunicationRequirements-label" class="property-label"><g:message code="communicationManagementPlan.stakeholderCommunicationRequirements.label" default="Stakeholder Communication Requirements" /></span>
					
						<span class="property-value" aria-labelledby="stakeholderCommunicationRequirements-label">${communicationManagementPlanInstance.stakeholderCommunicationRequirements}</span>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.stakeholderRoles}">
				<li class="fieldcontain">
					<span id="stakeholderRoles-label" class="property-label"><g:message code="communicationManagementPlan.stakeholderRoles.label" default="Stakeholder Roles" /></span>
					
						<g:each in="${communicationManagementPlanInstance.stakeholderRoles}" var="s">
						<span class="property-value" aria-labelledby="stakeholderRoles-label"><g:link controller="stakeholderRoles" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.projectTeamDirectory}">
				<li class="fieldcontain">
					<span id="projectTeamDirectory-label" class="property-label"><g:message code="communicationManagementPlan.projectTeamDirectory.label" default="Project Team Directory" /></span>
					
						<g:each in="${communicationManagementPlanInstance.projectTeamDirectory}" var="p">
						<span class="property-value" aria-labelledby="projectTeamDirectory-label"><g:link controller="stakeholderRegister" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.communicationMethodsAndTechnologies}">
				<li class="fieldcontain">
					<span id="communicationMethodsAndTechnologies-label" class="property-label"><g:message code="communicationManagementPlan.communicationMethodsAndTechnologies.label" default="Communication Methods And Technologies" /></span>
					
						<span class="property-value" aria-labelledby="communicationMethodsAndTechnologies-label">${communicationManagementPlanInstance.communicationMethodsAndTechnologies}</span>
					
				</li>
				</g:if>
			
				<g:if test="${communicationManagementPlanInstance?.changeControlBoard}">
				<li class="fieldcontain">
					<span id="changeControlBoard-label" class="property-label"><g:message code="communicationManagementPlan.changeControlBoard.label" default="Change Control Board" /></span>
					
						<span class="property-value" aria-labelledby="changeControlBoard-label"><g:link controller="changeControlBoard" action="show" id="${communicationManagementPlanInstance?.changeControlBoard?.id}">${communicationManagementPlanInstance?.changeControlBoard?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${communicationManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${communicationManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
