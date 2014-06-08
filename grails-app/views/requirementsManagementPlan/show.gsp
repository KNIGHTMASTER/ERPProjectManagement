
<%@ page import="ProjectScopeManagement.CollectRequirements.RequirementsManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirementsManagementPlan.label', default: 'RequirementsManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirementsManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
			</ul>
		</div>
		<div id="show-requirementsManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirementsManagementPlan">
			
				<g:if test="${requirementsManagementPlanInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="requirementsManagementPlan.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${requirementsManagementPlanInstance?.projectName?.id}">${requirementsManagementPlanInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.requirementsCollection}">
				<li class="fieldcontain">
					<span id="requirementsCollection-label" class="property-label"><g:message code="requirementsManagementPlan.requirementsCollection.label" default="Requirements Collection" /></span>
					
						<span class="property-value" aria-labelledby="requirementsCollection-label">${requirementsManagementPlanInstance.requirementsCollection}
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="requirementsManagementPlan.categories.label" default="Categories" /></span>
					
						<span class="property-value" aria-labelledby="categories-label">${requirementsManagementPlanInstance.categories}
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.prioritization}">
				<li class="fieldcontain">
					<span id="prioritization-label" class="property-label"><g:message code="requirementsManagementPlan.prioritization.label" default="Prioritization" /></span>
					
						<span class="property-value" aria-labelledby="prioritization-label">${requirementsManagementPlanInstance.prioritization}
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.traceability}">
				<li class="fieldcontain">
					<span id="traceability-label" class="property-label"><g:message code="requirementsManagementPlan.traceability.label" default="Traceability" /></span>
					
						<span class="property-value" aria-labelledby="traceability-label">${requirementsManagementPlanInstance.traceability}
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.configurationManagement}">
				<li class="fieldcontain">
					<span id="configurationManagement-label" class="property-label"><g:message code="requirementsManagementPlan.configurationManagement.label" default="Configuration Management" /></span>
					
						<span class="property-value" aria-labelledby="configurationManagement-label">${requirementsManagementPlanInstance.configurationManagement}
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.verification}">
				<li class="fieldcontain">
					<span id="verification-label" class="property-label"><g:message code="requirementsManagementPlan.verification.label" default="Verification" /></span>
					
						<span class="property-value" aria-labelledby="verification-label">${requirementsManagementPlanInstance.verification}
					
				</li>
				</g:if>
			
				<g:if test="${requirementsManagementPlanInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="requirementsManagementPlan.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${requirementsManagementPlanInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementsManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementsManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
