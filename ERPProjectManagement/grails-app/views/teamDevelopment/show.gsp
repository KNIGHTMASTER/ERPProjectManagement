
<%@ page import="ProjectHumanResourceManagement.TeamDevelopment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamDevelopment.label', default: 'TeamDevelopment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-teamDevelopment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-teamDevelopment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list teamDevelopment">
			
				<g:if test="${teamDevelopmentInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="teamDevelopment.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${teamDevelopmentInstance?.activity?.id}">${teamDevelopmentInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamDevelopmentInstance?.leader}">
				<li class="fieldcontain">
					<span id="leader-label" class="property-label"><g:message code="teamDevelopment.leader.label" default="Leader" /></span>
					
						<span class="property-value" aria-labelledby="leader-label"><g:link controller="employee" action="show" id="${teamDevelopmentInstance?.leader?.id}">${teamDevelopmentInstance?.leader?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamDevelopmentInstance?.teamMembers}">
				<li class="fieldcontain">
					<span id="teamMembers-label" class="property-label"><g:message code="teamDevelopment.teamMembers.label" default="Team Members" /></span>
					
						<g:each in="${teamDevelopmentInstance.teamMembers}" var="t">
						<span class="property-value" aria-labelledby="teamMembers-label"><g:link controller="employee" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${teamDevelopmentInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="teamDevelopment.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${teamDevelopmentInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teamDevelopmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${teamDevelopmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
