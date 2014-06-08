
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectOverview" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectOverview.label', default: 'ProjectOverview')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectOverview" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectOverview" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectOverview">
			
				<g:if test="${projectOverviewInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectOverview.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${projectOverviewInstance?.projectName?.id}">${projectOverviewInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectOverviewInstance?.projectDescription}">
				<li class="fieldcontain">
					<span id="projectDescription-label" class="property-label"><g:message code="projectOverview.projectDescription.label" default="Project Description" /></span>
					
						<span class="property-value" aria-labelledby="projectDescription-label">${projectOverviewInstance.projectDescription}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectOverviewInstance?.projectAssumptions}">
				<li class="fieldcontain">
					<span id="projectAssumptions-label" class="property-label"><g:message code="projectOverview.projectAssumptions.label" default="Project Assumptions" /></span>
					
						<span class="property-value" aria-labelledby="projectAssumptions-label">${projectOverviewInstance.projectAssumptions}</span>
					
				</li>
				</g:if>
			
				<g:if test="${projectOverviewInstance?.projectConstraints}">
				<li class="fieldcontain">
					<span id="projectConstraints-label" class="property-label"><g:message code="projectOverview.projectConstraints.label" default="Project Constraints" /></span>
					
						<span class="property-value" aria-labelledby="projectConstraints-label">${projectOverviewInstance.projectConstraints}</span>
					
				</li>
				</g:if> 
                        
                          
			
				<g:if test="${projectOverviewInstance?.goalsAndObjectives}">
				<li class="fieldcontain">
					<span id="goalsAndObjectives-label" class="property-label"><g:message code="projectOverview.goalsAndObjectives.label" default="Goals And Objectives" /></span>
					
						<g:each in="${projectOverviewInstance.goalsAndObjectives}" var="g">
						<span class="property-value" aria-labelledby="goalsAndObjectives-label"><g:link controller="goalsAndObjectives" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectOverviewInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectOverviewInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
