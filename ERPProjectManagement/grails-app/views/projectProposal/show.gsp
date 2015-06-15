
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectProposal.label', default: 'ProjectProposal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectProposal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectProposal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectProposal">
			
				<g:if test="${projectProposalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectProposal.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${projectProposalInstance?.projectName?.id}">${projectProposalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.plannedBudget}">
				<li class="fieldcontain">
					<span id="plannedBudget-label" class="property-label"><g:message code="projectProposal.plannedBudget.label" default="Planned Budget" /></span>
					
						<span class="property-value" aria-labelledby="plannedBudget-label"><g:fieldValue bean="${projectProposalInstance}" field="plannedBudget"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.priorityOfTheProject}">
				<li class="fieldcontain">
					<span id="priorityOfTheProject-label" class="property-label"><g:message code="projectProposal.priorityOfTheProject.label" default="Priority Of The Project" /></span>
					
						<span class="property-value" aria-labelledby="priorityOfTheProject-label"><g:fieldValue bean="${projectProposalInstance}" field="priorityOfTheProject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.projectDescription}">
				<li class="fieldcontain">
					<span id="projectDescription-label" class="property-label"><g:message code="projectProposal.projectDescription.label" default="Project Description" /></span>
					
						<span class="property-value" aria-labelledby="projectDescription-label"><g:fieldValue bean="${projectProposalInstance}" field="projectDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.requestedStartDate}">
				<li class="fieldcontain">
					<span id="requestedStartDate-label" class="property-label"><g:message code="projectProposal.requestedStartDate.label" default="Requested Start Date" /></span>
					
						<span class="property-value" aria-labelledby="requestedStartDate-label"><g:formatDate date="${projectProposalInstance?.requestedStartDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.requestedCompletionDate}">
				<li class="fieldcontain">
					<span id="requestedCompletionDate-label" class="property-label"><g:message code="projectProposal.requestedCompletionDate.label" default="Requested Completion Date" /></span>
					
						<span class="property-value" aria-labelledby="requestedCompletionDate-label"><g:formatDate date="${projectProposalInstance?.requestedCompletionDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.projectType}">
				<li class="fieldcontain">
					<span id="projectType-label" class="property-label"><g:message code="projectProposal.projectType.label" default="Project Type" /></span>
					
						<span class="property-value" aria-labelledby="projectType-label"><g:link controller="projectType" action="show" id="${projectProposalInstance?.projectType?.id}">${projectProposalInstance?.projectType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="projectProposal.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectProposalInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectProposalInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectProposalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
