
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.StakeholderManagementStrategy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stakeholderManagementStrategy.label', default: 'StakeholderManagementStrategy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stakeholderManagementStrategy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stakeholderManagementStrategy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stakeholderManagementStrategy">
			
				<g:if test="${stakeholderManagementStrategyInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="stakeholderManagementStrategy.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${stakeholderManagementStrategyInstance?.projectName?.id}">${stakeholderManagementStrategyInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderManagementStrategyInstance?.projectStatusControl}">
				<li class="fieldcontain">
					<span id="projectStatusControl-label" class="property-label"><g:message code="stakeholderManagementStrategy.projectStatusControl.label" default="Project Status Control" /></span>
					
						<span class="property-value" aria-labelledby="projectStatusControl-label"><g:fieldValue bean="${stakeholderManagementStrategyInstance}" field="projectStatusControl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stakeholderManagementStrategyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="stakeholderManagementStrategy.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label">${stakeholderManagementStrategyInstance.description}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stakeholderManagementStrategyInstance?.id}" />
					<g:link class="edit" action="edit" id="${stakeholderManagementStrategyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
