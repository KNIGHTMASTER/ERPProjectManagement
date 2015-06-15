
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.BusinessCaseAnalysisTeam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'businessCaseAnalysisTeam.label', default: 'BusinessCaseAnalysisTeam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-businessCaseAnalysisTeam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-businessCaseAnalysisTeam" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list businessCaseAnalysisTeam">
			
				<g:if test="${businessCaseAnalysisTeamInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="businessCaseAnalysisTeam.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="businessCase" action="show" id="${businessCaseAnalysisTeamInstance?.projectName?.id}">${businessCaseAnalysisTeamInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessCaseAnalysisTeamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="businessCaseAnalysisTeam.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:link controller="stakeholderRegister" action="show" id="${businessCaseAnalysisTeamInstance?.name?.id}">${businessCaseAnalysisTeamInstance?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessCaseAnalysisTeamInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="businessCaseAnalysisTeam.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${businessCaseAnalysisTeamInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${businessCaseAnalysisTeamInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="businessCaseAnalysisTeam.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${businessCaseAnalysisTeamInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${businessCaseAnalysisTeamInstance?.id}" />
					<g:link class="edit" action="edit" id="${businessCaseAnalysisTeamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
