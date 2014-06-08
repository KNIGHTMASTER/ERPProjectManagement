
<%@ page import="ProjectCommunicationManagement.IdentifyStakeholders.Requirement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requirement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirement">
			
				<g:if test="${requirementInstance?.idRequirement}">
				<li class="fieldcontain">
					<span id="idRequirement-label" class="property-label"><g:message code="requirement.idRequirement.label" default="Id Requirement" /></span>
					
						<span class="property-value" aria-labelledby="idRequirement-label"><g:fieldValue bean="${requirementInstance}" field="idRequirement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="requirement.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${requirementInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.requirement}">
				<li class="fieldcontain">
					<span id="requirement-label" class="property-label"><g:message code="requirement.requirement.label" default="Requirement" /></span>
					
						<span class="property-value" aria-labelledby="requirement-label"><g:fieldValue bean="${requirementInstance}" field="requirement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.descriptions}">
				<li class="fieldcontain">
					<span id="descriptions-label" class="property-label"><g:message code="requirement.descriptions.label" default="Descriptions" /></span>
					
						<span class="property-value" aria-labelledby="descriptions-label"><g:fieldValue bean="${requirementInstance}" field="descriptions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.stakeholderRegister}">
				<li class="fieldcontain">
					<span id="stakeholderRegister-label" class="property-label"><g:message code="requirement.stakeholderRegister.label" default="Stakeholder Register" /></span>
					
						<g:each in="${requirementInstance.stakeholderRegister}" var="s">
						<span class="property-value" aria-labelledby="stakeholderRegister-label"><g:link controller="stakeholderRegister" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
