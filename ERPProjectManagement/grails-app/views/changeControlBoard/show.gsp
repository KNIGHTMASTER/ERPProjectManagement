
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeControlBoard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeControlBoard.label', default: 'ChangeControlBoard')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-changeControlBoard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-changeControlBoard" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list changeControlBoard">
			
				<g:if test="${changeControlBoardInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="changeControlBoard.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="changeManagementPlan" action="show" id="${changeControlBoardInstance?.projectName?.id}">${changeControlBoardInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeControlBoardInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="changeControlBoard.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${changeControlBoardInstance?.stakeholder?.id}">${changeControlBoardInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeControlBoardInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="changeControlBoard.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${changeControlBoardInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeControlBoardInstance?.responsibility}">
				<li class="fieldcontain">
					<span id="responsibility-label" class="property-label"><g:message code="changeControlBoard.responsibility.label" default="Responsibility" /></span>
					
						<span class="property-value" aria-labelledby="responsibility-label"><g:fieldValue bean="${changeControlBoardInstance}" field="responsibility"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeControlBoardInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="changeControlBoard.authority.label" default="Authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${changeControlBoardInstance}" field="authority"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${changeControlBoardInstance?.id}" />
					<g:link class="edit" action="edit" id="${changeControlBoardInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
