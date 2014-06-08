
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProblemDefinition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problemDefinition.label', default: 'ProblemDefinition')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-problemDefinition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-problemDefinition" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list problemDefinition">
			
				<g:if test="${problemDefinitionInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="problemDefinition.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="businessCase" action="show" id="${problemDefinitionInstance?.projectName?.id}">${problemDefinitionInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${problemDefinitionInstance?.problemStatement}">
				<li class="fieldcontain">
					<span id="problemStatement-label" class="property-label"><g:message code="problemDefinition.problemStatement.label" default="Problem Statement" /></span>
					
						<span class="property-value" aria-labelledby="problemStatement-label">${problemDefinitionInstance.problemStatement}</span>
					
				</li>
				</g:if>
			
				<g:if test="${problemDefinitionInstance?.organizationalImpact}">
				<li class="fieldcontain">
					<span id="organizationalImpact-label" class="property-label"><g:message code="problemDefinition.organizationalImpact.label" default="Organizational Impact" /></span>
					
						<span class="property-value" aria-labelledby="organizationalImpact-label">${problemDefinitionInstance.organizationalImpact}</span>
					
				</li>
				</g:if>
			
				<g:if test="${problemDefinitionInstance?.technologyMigration}">
				<li class="fieldcontain">
					<span id="technologyMigration-label" class="property-label"><g:message code="problemDefinition.technologyMigration.label" default="Technology Migration" /></span>
					
						<span class="property-value" aria-labelledby="technologyMigration-label">${problemDefinitionInstance.technologyMigration}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${problemDefinitionInstance?.id}" />
					<g:link class="edit" action="edit" id="${problemDefinitionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
