
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.InternalProcess" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'internalProcess.label', default: 'InternalProcess')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-internalProcess" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-internalProcess" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list internalProcess">
			
				<g:if test="${internalProcessInstance?.nActivity}">
				<li class="fieldcontain">
					<span id="nActivity-label" class="property-label"><g:message code="internalProcess.nActivity.label" default="NA ctivity" /></span>
					
						<span class="property-value" aria-labelledby="nActivity-label"><g:fieldValue bean="${internalProcessInstance}" field="nActivity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${internalProcessInstance?.nDelay}">
				<li class="fieldcontain">
					<span id="nDelay-label" class="property-label"><g:message code="internalProcess.nDelay.label" default="ND elay" /></span>
					
						<span class="property-value" aria-labelledby="nDelay-label"><g:fieldValue bean="${internalProcessInstance}" field="nDelay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${internalProcessInstance?.nMissSequence}">
				<li class="fieldcontain">
					<span id="nMissSequence-label" class="property-label"><g:message code="internalProcess.nMissSequence.label" default="NM iss Sequence" /></span>
					
						<span class="property-value" aria-labelledby="nMissSequence-label"><g:fieldValue bean="${internalProcessInstance}" field="nMissSequence"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${internalProcessInstance?.id}" />
					<g:link class="edit" action="edit" id="${internalProcessInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
