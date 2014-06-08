
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.WorkRequirements" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workRequirements.label', default: 'WorkRequirements')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workRequirements" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workRequirements" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workRequirements">
			
				<g:if test="${workRequirementsInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="workRequirements.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${workRequirementsInstance?.projectName?.id}">${workRequirementsInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${workRequirementsInstance?.workPackage}">
				<li class="fieldcontain">
					<span id="workPackage-label" class="property-label"><g:message code="workRequirements.workPackage.label" default="Work Package" /></span>
					
						<span class="property-value" aria-labelledby="workPackage-label"><g:fieldValue bean="${workRequirementsInstance}" field="workPackage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workRequirementsInstance?.start}">
				<li class="fieldcontain">
					<span id="start-label" class="property-label"><g:message code="workRequirements.start.label" default="Start" /></span>
					
						<span class="property-value" aria-labelledby="start-label"><g:formatDate date="${workRequirementsInstance?.start}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workRequirementsInstance?.finish}">
				<li class="fieldcontain">
					<span id="finish-label" class="property-label"><g:message code="workRequirements.finish.label" default="Finish" /></span>
					
						<span class="property-value" aria-labelledby="finish-label"><g:formatDate date="${workRequirementsInstance?.finish}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workRequirementsInstance?.id}" />
					<g:link class="edit" action="edit" id="${workRequirementsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
