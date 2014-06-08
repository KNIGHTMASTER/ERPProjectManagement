
<%@ page import="ProjectScopeManagement.CreateWBS.Element" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-element" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list element">
			
				<g:if test="${elementInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="element.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${elementInstance?.projectName?.id}">${elementInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.wbsName}">
				<li class="fieldcontain">
					<span id="wbsName-label" class="property-label"><g:message code="element.wbsName.label" default="Wbs Name" /></span>
					
						<span class="property-value" aria-labelledby="wbsName-label"><g:link controller="wbs" action="show" id="${elementInstance?.wbsName?.id}">${elementInstance?.wbsName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="element.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${elementInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.wbsCode}">
				<li class="fieldcontain">
					<span id="wbsCode-label" class="property-label"><g:message code="element.wbsCode.label" default="Wbs Code" /></span>
					
						<span class="property-value" aria-labelledby="wbsCode-label"><g:fieldValue bean="${elementInstance}" field="wbsCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${elementInstance?.elementName}">
				<li class="fieldcontain">
					<span id="elementName-label" class="property-label"><g:message code="element.elementName.label" default="Element Name" /></span>
					
						<span class="property-value" aria-labelledby="elementName-label"><g:fieldValue bean="${elementInstance}" field="elementName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${elementInstance?.id}" />
					<g:link class="edit" action="edit" id="${elementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
