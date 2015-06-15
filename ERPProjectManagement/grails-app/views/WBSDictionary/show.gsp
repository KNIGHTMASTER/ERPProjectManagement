
<%@ page import="ProjectScopeManagement.CreateWBS.WbsDictionary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wbsDictionary.label', default: 'WbsDictionary')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wbsDictionary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wbsDictionary" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wbsDictionary">
			
				<g:if test="${wbsDictionaryInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="wbsDictionary.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${wbsDictionaryInstance?.projectName?.id}">${wbsDictionaryInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsDictionaryInstance?.wbsName}">
				<li class="fieldcontain">
					<span id="wbsName-label" class="property-label"><g:message code="wbsDictionary.wbsName.label" default="Wbs Name" /></span>
					
						<span class="property-value" aria-labelledby="wbsName-label"><g:link controller="wbs" action="show" id="${wbsDictionaryInstance?.wbsName?.id}">${wbsDictionaryInstance?.wbsName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsDictionaryInstance?.element}">
				<li class="fieldcontain">
					<span id="element-label" class="property-label"><g:message code="wbsDictionary.element.label" default="Element" /></span>
					
						<span class="property-value" aria-labelledby="element-label"><g:link controller="element" action="show" id="${wbsDictionaryInstance?.element?.id}">${wbsDictionaryInstance?.element?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsDictionaryInstance?.definition}">
				<li class="fieldcontain">
					<span id="definition-label" class="property-label"><g:message code="wbsDictionary.definition.label" default="Definition" /></span>
					
						<span class="property-value" aria-labelledby="definition-label"><g:fieldValue bean="${wbsDictionaryInstance}" field="definition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsDictionaryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="wbsDictionary.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${wbsDictionaryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wbsDictionaryInstance?.id}" />
					<g:link class="edit" action="edit" id="${wbsDictionaryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
