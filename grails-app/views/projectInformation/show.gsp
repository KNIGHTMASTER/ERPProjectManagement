
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectInformation.label', default: 'ProjectInformation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectInformation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectInformation">
			
				<g:if test="${projectInformationInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectInformation.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${projectInformationInstance?.projectName?.id}">${projectInformationInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInformationInstance?.projectStatus}">
				<li class="fieldcontain">
					<span id="projectStatus-label" class="property-label"><g:message code="projectInformation.projectStatus.label" default="Project Status" /></span>
					
						<span class="property-value" aria-labelledby="projectStatus-label"><g:fieldValue bean="${projectInformationInstance}" field="projectStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInformationInstance?.acceptance}">
				<li class="fieldcontain">
					<span id="acceptance-label" class="property-label"><g:message code="projectInformation.acceptance.label" default="Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="acceptance-label"><g:formatBoolean boolean="${projectInformationInstance?.acceptance}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInformationInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectInformationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
