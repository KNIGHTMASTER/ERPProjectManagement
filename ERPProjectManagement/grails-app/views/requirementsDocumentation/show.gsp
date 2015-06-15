
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsDocumentation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementsDocumentation.label', default: 'RequirementsDocumentation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirementsDocumentation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requirementsDocumentation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirementsDocumentation">
			
				<g:if test="${requirementsDocumentationInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="requirementsDocumentation.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${requirementsDocumentationInstance?.projectName?.id}">${requirementsDocumentationInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsDocumentationInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="requirementsDocumentation.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${requirementsDocumentationInstance?.stakeholder?.id}">${requirementsDocumentationInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsDocumentationInstance?.requirement}">
				<li class="fieldcontain">
					<span id="requirement-label" class="property-label"><g:message code="requirementsDocumentation.requirement.label" default="Requirement" /></span>
					
						<span class="property-value" aria-labelledby="requirement-label"><g:fieldValue bean="${requirementsDocumentationInstance}" field="requirement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsDocumentationInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="requirementsDocumentation.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${requirementsDocumentationInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsDocumentationInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="requirementsDocumentation.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${requirementsDocumentationInstance}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsDocumentationInstance?.acceptanceCriteria}">
				<li class="fieldcontain">
					<span id="acceptanceCriteria-label" class="property-label"><g:message code="requirementsDocumentation.acceptanceCriteria.label" default="Acceptance Criteria" /></span>
					
						<span class="property-value" aria-labelledby="acceptanceCriteria-label"><g:fieldValue bean="${requirementsDocumentationInstance}" field="acceptanceCriteria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsDocumentationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="requirementsDocumentation.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${requirementsDocumentationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementsDocumentationInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementsDocumentationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
