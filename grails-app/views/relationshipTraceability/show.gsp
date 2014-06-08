
<%@ page import="ProjectScopeManagement.CollectRequirements.RelationshipTraceability" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'relationshipTraceability.label', default: 'RelationshipTraceability')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-relationshipTraceability" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-relationshipTraceability" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list relationshipTraceability">
			
				<g:if test="${relationshipTraceabilityInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="relationshipTraceability.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${relationshipTraceabilityInstance?.projectName?.id}">${relationshipTraceabilityInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${relationshipTraceabilityInstance?.requirementsTraceabilityMatrix}">
				<li class="fieldcontain">
					<span id="requirementsTraceabilityMatrix-label" class="property-label"><g:message code="relationshipTraceability.requirementsTraceabilityMatrix.label" default="Requirements Traceability Matrix" /></span>
					
						<span class="property-value" aria-labelledby="requirementsTraceabilityMatrix-label"><g:link controller="requirementsTraceabilityMatrix" action="show" id="${relationshipTraceabilityInstance?.requirementsTraceabilityMatrix?.id}">${relationshipTraceabilityInstance?.requirementsTraceabilityMatrix?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${relationshipTraceabilityInstance?.relatesToObjectives}">
				<li class="fieldcontain">
					<span id="relatesToObjectives-label" class="property-label"><g:message code="relationshipTraceability.relatesToObjectives.label" default="Relates To Objectives" /></span>
					
						<span class="property-value" aria-labelledby="relatesToObjectives-label"><g:fieldValue bean="${relationshipTraceabilityInstance}" field="relatesToObjectives"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relationshipTraceabilityInstance?.manifestInWBSDeliverable}">
				<li class="fieldcontain">
					<span id="manifestInWBSDeliverable-label" class="property-label"><g:message code="relationshipTraceability.manifestInWBSDeliverable.label" default="Manifest In WBSD eliverable" /></span>
					
						<span class="property-value" aria-labelledby="manifestInWBSDeliverable-label"><g:fieldValue bean="${relationshipTraceabilityInstance}" field="manifestInWBSDeliverable"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relationshipTraceabilityInstance?.verification}">
				<li class="fieldcontain">
					<span id="verification-label" class="property-label"><g:message code="relationshipTraceability.verification.label" default="Verification" /></span>
					
						<span class="property-value" aria-labelledby="verification-label"><g:fieldValue bean="${relationshipTraceabilityInstance}" field="verification"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${relationshipTraceabilityInstance?.validation}">
				<li class="fieldcontain">
					<span id="validation-label" class="property-label"><g:message code="relationshipTraceability.validation.label" default="Validation" /></span>
					
						<span class="property-value" aria-labelledby="validation-label"><g:fieldValue bean="${relationshipTraceabilityInstance}" field="validation"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${relationshipTraceabilityInstance?.id}" />
					<g:link class="edit" action="edit" id="${relationshipTraceabilityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
