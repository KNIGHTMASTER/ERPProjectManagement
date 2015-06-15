
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.DefinitionsOfChange" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'definitionsOfChange.label', default: 'DefinitionsOfChange')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-definitionsOfChange" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-definitionsOfChange" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list definitionsOfChange">
			
				<g:if test="${definitionsOfChangeInstance?.changeManagementPlan}">
				<li class="fieldcontain">
					<span id="changeManagementPlan-label" class="property-label"><g:message code="definitionsOfChange.changeManagementPlan.label" default="Change Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="changeManagementPlan-label"><g:link controller="changeManagementPlan" action="show" id="${definitionsOfChangeInstance?.changeManagementPlan?.id}">${definitionsOfChangeInstance?.changeManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${definitionsOfChangeInstance?.scheduleChange}">
				<li class="fieldcontain">
					<span id="scheduleChange-label" class="property-label"><g:message code="definitionsOfChange.scheduleChange.label" default="Schedule Change" /></span>
					
						<span class="property-value" aria-labelledby="scheduleChange-label">${definitionsOfChangeInstance.scheduleChange}
					
				</li>
				</g:if>
			
				<g:if test="${definitionsOfChangeInstance?.budgetChange}">
				<li class="fieldcontain">
					<span id="budgetChange-label" class="property-label"><g:message code="definitionsOfChange.budgetChange.label" default="Budget Change" /></span>
					
						<span class="property-value" aria-labelledby="budgetChange-label">${definitionsOfChangeInstance.budgetChange}
					
				</li>
				</g:if>
			
				<g:if test="${definitionsOfChangeInstance?.scopeChange}">
				<li class="fieldcontain">
					<span id="scopeChange-label" class="property-label"><g:message code="definitionsOfChange.scopeChange.label" default="Scope Change" /></span>
					
						<span class="property-value" aria-labelledby="scopeChange-label">${definitionsOfChangeInstance.scopeChange}
					
				</li>
				</g:if>
			
				<g:if test="${definitionsOfChangeInstance?.projectDocumentChanges}">
				<li class="fieldcontain">
					<span id="projectDocumentChanges-label" class="property-label"><g:message code="definitionsOfChange.projectDocumentChanges.label" default="Project Document Changes" /></span>
					
						<span class="property-value" aria-labelledby="projectDocumentChanges-label">${definitionsOfChangeInstance.projectDocumentChanges}
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${definitionsOfChangeInstance?.id}" />
					<g:link class="edit" action="edit" id="${definitionsOfChangeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
