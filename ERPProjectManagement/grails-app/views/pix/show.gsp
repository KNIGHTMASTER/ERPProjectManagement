
<%@ page import="ProjectTimeManagement.Utility.Pix" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pix.label', default: 'Pix')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pix" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pix" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pix">
			
				<g:if test="${pixInstance?.widget}">
				<li class="fieldcontain">
					<span id="widget-label" class="property-label"><g:message code="pix.widget.label" default="Widget" /></span>
					
						<span class="property-value" aria-labelledby="widget-label"><g:link controller="widget" action="show" id="${pixInstance?.widget?.id}">${pixInstance?.widget?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pixInstance?.mile}">
				<li class="fieldcontain">
					<span id="mile-label" class="property-label"><g:message code="pix.mile.label" default="Mile" /></span>
					
						<span class="property-value" aria-labelledby="mile-label"><g:fieldValue bean="${pixInstance}" field="mile"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pixInstance?.id}" />
					<g:link class="edit" action="edit" id="${pixInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
