
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.RequestProjectManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requestProjectManagementPlan.label', default: 'RequestProjectManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requestProjectManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requestProjectManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requestProjectManagementPlan">
			
				<g:if test="${requestProjectManagementPlanInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="requestProjectManagementPlan.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${requestProjectManagementPlanInstance?.projectName?.id}">${requestProjectManagementPlanInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requestProjectManagementPlanInstance?.functionalPlan}">
				<li class="fieldcontain">
					<span id="functionalPlan-label" class="property-label"><g:message code="requestProjectManagementPlan.functionalPlan.label" default="Functional Plan" /></span>
					
						<span class="property-value" aria-labelledby="functionalPlan-label"><g:fieldValue bean="${requestProjectManagementPlanInstance}" field="functionalPlan"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requestProjectManagementPlanInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="requestProjectManagementPlan.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${requestProjectManagementPlanInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requestProjectManagementPlanInstance?.request}">
				<li class="fieldcontain">
					<span id="request-label" class="property-label"><g:message code="requestProjectManagementPlan.request.label" default="Request" /></span>
					
						<span class="property-value" aria-labelledby="request-label"><g:formatBoolean boolean="${requestProjectManagementPlanInstance?.request}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requestProjectManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${requestProjectManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
