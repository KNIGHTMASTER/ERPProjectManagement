
<%@ page import="ProjectCommunicationManagement.ManageStakeholderExpectations.ProjectResponseQuality" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectResponseQuality.label', default: 'ProjectResponseQuality')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectResponseQuality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectResponseQuality" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectResponseQuality">
			
				<g:if test="${projectResponseQualityInstance?.projectCharter}">
				<li class="fieldcontain">
					<span id="projectCharter-label" class="property-label"><g:message code="projectResponseQuality.projectCharter.label" default="Project Charter" /></span>
					
						<span class="property-value" aria-labelledby="projectCharter-label"><g:link controller="projectCharter" action="show" id="${projectResponseQualityInstance?.projectCharter?.id}">${projectResponseQualityInstance?.projectCharter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectResponseQualityInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="projectResponseQuality.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${projectResponseQualityInstance?.stakeholder?.id}">${projectResponseQualityInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectResponseQualityInstance?.quality}">
				<li class="fieldcontain">
					<span id="quality-label" class="property-label"><g:message code="projectResponseQuality.quality.label" default="Quality" /></span>
					
						<span class="property-value" aria-labelledby="quality-label"><g:fieldValue bean="${projectResponseQualityInstance}" field="quality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectResponseQualityInstance?.scope}">
				<li class="fieldcontain">
					<span id="scope-label" class="property-label"><g:message code="projectResponseQuality.scope.label" default="Scope" /></span>
					
						<span class="property-value" aria-labelledby="scope-label"><g:fieldValue bean="${projectResponseQualityInstance}" field="scope"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectResponseQualityInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectResponseQualityInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
