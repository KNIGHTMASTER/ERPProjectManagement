
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.ManagementStrategy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementStrategy.label', default: 'ManagementStrategy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-managementStrategy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-managementStrategy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list managementStrategy">
			
				<g:if test="${managementStrategyInstance?.key}">
				<li class="fieldcontain">
					<span id="key-label" class="property-label"><g:message code="managementStrategy.key.label" default="Key" /></span>
					
						<span class="property-value" aria-labelledby="key-label"><g:fieldValue bean="${managementStrategyInstance}" field="key"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementStrategyInstance?.organization}">
				<li class="fieldcontain">
					<span id="organization-label" class="property-label"><g:message code="managementStrategy.organization.label" default="Organization" /></span>
					
						<span class="property-value" aria-labelledby="organization-label"><g:fieldValue bean="${managementStrategyInstance}" field="organization"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementStrategyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="managementStrategy.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${managementStrategyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementStrategyInstance?.power}">
				<li class="fieldcontain">
					<span id="power-label" class="property-label"><g:message code="managementStrategy.power.label" default="Power" /></span>
					
						<span class="property-value" aria-labelledby="power-label"><g:fieldValue bean="${managementStrategyInstance}" field="power"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementStrategyInstance?.interest}">
				<li class="fieldcontain">
					<span id="interest-label" class="property-label"><g:message code="managementStrategy.interest.label" default="Interest" /></span>
					
						<span class="property-value" aria-labelledby="interest-label"><g:fieldValue bean="${managementStrategyInstance}" field="interest"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managementStrategyInstance?.id}" />
					<g:link class="edit" action="edit" id="${managementStrategyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
