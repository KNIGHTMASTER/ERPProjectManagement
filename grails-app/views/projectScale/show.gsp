
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectScale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectScale.label', default: 'ProjectScale')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectScale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectScale" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectScale">
			
				<g:if test="${projectScaleInstance?.scale}">
				<li class="fieldcontain">
					<span id="scale-label" class="property-label"><g:message code="projectScale.scale.label" default="Scale" /></span>
					
						<span class="property-value" aria-labelledby="scale-label"><g:fieldValue bean="${projectScaleInstance}" field="scale"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectScaleInstance?.minPrice}">
				<li class="fieldcontain">
					<span id="minPrice-label" class="property-label"><g:message code="projectScale.minPrice.label" default="Min Price" /></span>
					
						<span class="property-value" aria-labelledby="minPrice-label"><g:fieldValue bean="${projectScaleInstance}" field="minPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectScaleInstance?.maxPrice}">
				<li class="fieldcontain">
					<span id="maxPrice-label" class="property-label"><g:message code="projectScale.maxPrice.label" default="Max Price" /></span>
					
						<span class="property-value" aria-labelledby="maxPrice-label"><g:fieldValue bean="${projectScaleInstance}" field="maxPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectScaleInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="projectScale.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectScaleInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectScaleInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectScaleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
