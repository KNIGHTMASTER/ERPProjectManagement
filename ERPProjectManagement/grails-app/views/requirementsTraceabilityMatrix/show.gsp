
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsTraceabilityMatrix" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementsTraceabilityMatrix.label', default: 'RequirementsTraceabilityMatrix')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirementsTraceabilityMatrix" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requirementsTraceabilityMatrix" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirementsTraceabilityMatrix">
			
				<g:if test="${requirementsTraceabilityMatrixInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="requirementsTraceabilityMatrix.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${requirementsTraceabilityMatrixInstance?.projectName?.id}">${requirementsTraceabilityMatrixInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsTraceabilityMatrixInstance?.requirementInformation}">
				<li class="fieldcontain">
					<span id="requirementInformation-label" class="property-label"><g:message code="requirementsTraceabilityMatrix.requirementInformation.label" default="Requirement Information" /></span>
					
						<g:each in="${requirementsTraceabilityMatrixInstance.requirementInformation}" var="r">
						<span class="property-value" aria-labelledby="requirementInformation-label"><g:link controller="requirementInformation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsTraceabilityMatrixInstance?.relationshipTraceability}">
				<li class="fieldcontain">
					<span id="relationshipTraceability-label" class="property-label"><g:message code="requirementsTraceabilityMatrix.relationshipTraceability.label" default="Relationship Traceability" /></span>
					
						<g:each in="${requirementsTraceabilityMatrixInstance.relationshipTraceability}" var="r">
						<span class="property-value" aria-labelledby="relationshipTraceability-label"><g:link controller="relationshipTraceability" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsTraceabilityMatrixInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="requirementsTraceabilityMatrix.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${requirementsTraceabilityMatrixInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementsTraceabilityMatrixInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementsTraceabilityMatrixInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
