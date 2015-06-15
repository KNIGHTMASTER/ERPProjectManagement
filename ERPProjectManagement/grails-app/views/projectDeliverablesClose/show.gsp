
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.ProjectDeliverablesClose" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectDeliverablesClose.label', default: 'ProjectDeliverablesClose')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectDeliverablesClose" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectDeliverablesClose" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectDeliverablesClose">
			
				<g:if test="${projectDeliverablesCloseInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectDeliverablesClose.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${projectDeliverablesCloseInstance?.projectName?.id}">${projectDeliverablesCloseInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectDeliverablesCloseInstance?.milestone}">
				<li class="fieldcontain">
					<span id="milestone-label" class="property-label"><g:message code="projectDeliverablesClose.milestone.label" default="Milestone" /></span>
					
						<span class="property-value" aria-labelledby="milestone-label"><g:link controller="milestones" action="show" id="${projectDeliverablesCloseInstance?.milestone?.id}">${projectDeliverablesCloseInstance?.milestone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectDeliverablesCloseInstance?.plannedDeliverable}">
				<li class="fieldcontain">
					<span id="plannedDeliverable-label" class="property-label"><g:message code="projectDeliverablesClose.plannedDeliverable.label" default="Planned Deliverable" /></span>
					
						<span class="property-value" aria-labelledby="plannedDeliverable-label"><g:link controller="projectDeliverable" action="show" id="${projectDeliverablesCloseInstance?.plannedDeliverable?.id}">${projectDeliverablesCloseInstance?.plannedDeliverable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectDeliverablesCloseInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="projectDeliverablesClose.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${projectDeliverablesCloseInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectDeliverablesCloseInstance?.projectRecord}">
				<li class="fieldcontain">
					<span id="projectRecord-label" class="property-label"><g:message code="projectDeliverablesClose.projectRecord.label" default="Project Record" /></span>
					
						<span class="property-value" aria-labelledby="projectRecord-label"><g:link controller="projectRecord" action="show" id="${projectDeliverablesCloseInstance?.projectRecord?.id}">${projectDeliverablesCloseInstance?.projectRecord?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectDeliverablesCloseInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectDeliverablesCloseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
