
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.HandOver" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'handOver.label', default: 'HandOver')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-handOver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-handOver" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list handOver">
			
				<g:if test="${handOverInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="handOver.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${handOverInstance?.projectName?.id}">${handOverInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${handOverInstance?.handOverMethod}">
				<li class="fieldcontain">
					<span id="handOverMethod-label" class="property-label"><g:message code="handOver.handOverMethod.label" default="Hand Over Method" /></span>
					
						<span class="property-value" aria-labelledby="handOverMethod-label"><g:fieldValue bean="${handOverInstance}" field="handOverMethod"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${handOverInstance?.acceptances}">
				<li class="fieldcontain">
					<span id="acceptances-label" class="property-label"><g:message code="handOver.acceptances.label" default="Acceptances" /></span>
					
						<g:each in="${handOverInstance.acceptances}" var="a">
						<span class="property-value" aria-labelledby="acceptances-label"><g:link controller="handOverAcceptance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${handOverInstance?.id}" />
					<g:link class="edit" action="edit" id="${handOverInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
