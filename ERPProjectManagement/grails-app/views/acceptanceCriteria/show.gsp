
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.AcceptanceCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'acceptanceCriteria.label', default: 'AcceptanceCriteria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-acceptanceCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-acceptanceCriteria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list acceptanceCriteria">
			
				<g:if test="${acceptanceCriteriaInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="acceptanceCriteria.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${acceptanceCriteriaInstance?.projectName?.id}">${acceptanceCriteriaInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${acceptanceCriteriaInstance?.dateAcceptance}">
				<li class="fieldcontain">
					<span id="dateAcceptance-label" class="property-label"><g:message code="acceptanceCriteria.dateAcceptance.label" default="Date Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="dateAcceptance-label"><g:formatDate date="${acceptanceCriteriaInstance?.dateAcceptance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${acceptanceCriteriaInstance?.methodOfAcceptance}">
				<li class="fieldcontain">
					<span id="methodOfAcceptance-label" class="property-label"><g:message code="acceptanceCriteria.methodOfAcceptance.label" default="Method Of Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="methodOfAcceptance-label"><g:fieldValue bean="${acceptanceCriteriaInstance}" field="methodOfAcceptance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${acceptanceCriteriaInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="acceptanceCriteria.authority.label" default="Authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:link controller="stakeholderRegister" action="show" id="${acceptanceCriteriaInstance?.authority?.id}">${acceptanceCriteriaInstance?.authority?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${acceptanceCriteriaInstance?.id}" />
					<g:link class="edit" action="edit" id="${acceptanceCriteriaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
