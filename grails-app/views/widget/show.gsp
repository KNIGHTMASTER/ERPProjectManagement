
<%@ page import="ProjectTimeManagement.Utility.Widget" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'widget.label', default: 'Widget')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-widget" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-widget" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list widget">
			
				<g:if test="${widgetInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="widget.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:fieldValue bean="${widgetInstance}" field="project"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${widgetInstance?.pixes}">
				<li class="fieldcontain">
					<span id="pixes-label" class="property-label"><g:message code="widget.pixes.label" default="Pixes" /></span>
					
						<g:each in="${widgetInstance.pixes}" var="p">
						<span class="property-value" aria-labelledby="pixes-label"><g:link controller="pix" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${widgetInstance?.id}" />
					<g:link class="edit" action="edit" id="${widgetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
