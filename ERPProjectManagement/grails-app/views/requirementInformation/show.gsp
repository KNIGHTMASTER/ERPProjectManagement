
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementInformation.label', default: 'RequirementInformation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirementInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requirementInformation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirementInformation">
			
				<g:if test="${requirementInformationInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="requirementInformation.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${requirementInformationInstance?.projectName?.id}">${requirementInformationInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInformationInstance?.requirementsTraceabilityMatrix}">
				<li class="fieldcontain">
					<span id="requirementsTraceabilityMatrix-label" class="property-label"><g:message code="requirementInformation.requirementsTraceabilityMatrix.label" default="Requirements Traceability Matrix" /></span>
					
						<span class="property-value" aria-labelledby="requirementsTraceabilityMatrix-label"><g:link controller="requirementsTraceabilityMatrix" action="show" id="${requirementInformationInstance?.requirementsTraceabilityMatrix?.id}">${requirementInformationInstance?.requirementsTraceabilityMatrix?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInformationInstance?.requirement}">
				<li class="fieldcontain">
					<span id="requirement-label" class="property-label"><g:message code="requirementInformation.requirement.label" default="Requirement" /></span>
					
						<span class="property-value" aria-labelledby="requirement-label"><g:fieldValue bean="${requirementInformationInstance}" field="requirement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInformationInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="requirementInformation.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${requirementInformationInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInformationInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="requirementInformation.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${requirementInformationInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementInformationInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementInformationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
