
<%@ page import="ProjectScopeManagement.CreateWBS.ScopeBaseline" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scopeBaseline.label', default: 'ScopeBaseline')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-scopeBaseline" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-scopeBaseline" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list scopeBaseline">
			
				<g:if test="${scopeBaselineInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="scopeBaseline.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${scopeBaselineInstance?.projectName?.id}">${scopeBaselineInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scopeBaselineInstance?.projectScopeStatement}">
				<li class="fieldcontain">
					<span id="projectScopeStatement-label" class="property-label"><g:message code="scopeBaseline.projectScopeStatement.label" default="Project Scope Statement" /></span>
					
						<span class="property-value" aria-labelledby="projectScopeStatement-label"><g:link controller="projectScopeStatement" action="show" id="${scopeBaselineInstance?.projectScopeStatement?.id}">${scopeBaselineInstance?.projectScopeStatement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scopeBaselineInstance?.wbs}">
				<li class="fieldcontain">
					<span id="wbs-label" class="property-label"><g:message code="scopeBaseline.wbs.label" default="Wbs" /></span>
					
						<span class="property-value" aria-labelledby="wbs-label"><g:link controller="wbs" action="show" id="${scopeBaselineInstance?.wbs?.id}">${scopeBaselineInstance?.wbs?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scopeBaselineInstance?.wbsDictionary}">
				<li class="fieldcontain">
					<span id="wbsDictionary-label" class="property-label"><g:message code="scopeBaseline.wbsDictionary.label" default="Wbs Dictionary" /></span>
					
						<span class="property-value" aria-labelledby="wbsDictionary-label"><g:link controller="wbsDictionary" action="show" id="${scopeBaselineInstance?.wbsDictionary?.id}">${scopeBaselineInstance?.wbsDictionary?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${scopeBaselineInstance?.id}" />
					<g:link class="edit" action="edit" id="${scopeBaselineInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
