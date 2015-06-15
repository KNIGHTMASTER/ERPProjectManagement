
<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeBoardApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeBoardApproval.label', default: 'ChangeBoardApproval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-changeBoardApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-changeBoardApproval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list changeBoardApproval">
			
				<g:if test="${changeBoardApprovalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="changeBoardApproval.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${changeBoardApprovalInstance?.projectName?.id}">${changeBoardApprovalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeBoardApprovalInstance?.changeRequest}">
				<li class="fieldcontain">
					<span id="changeRequest-label" class="property-label"><g:message code="changeBoardApproval.changeRequest.label" default="Change Request" /></span>
					
						<span class="property-value" aria-labelledby="changeRequest-label"><g:link controller="changeRequest" action="show" id="${changeBoardApprovalInstance?.changeRequest?.id}">${changeBoardApprovalInstance?.changeRequest?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeBoardApprovalInstance?.peopleWhoApprove}">
				<li class="fieldcontain">
					<span id="peopleWhoApprove-label" class="property-label"><g:message code="changeBoardApproval.peopleWhoApprove.label" default="People Who Approve" /></span>
					
						<span class="property-value" aria-labelledby="peopleWhoApprove-label"><g:link controller="changeControlBoard" action="show" id="${changeBoardApprovalInstance?.peopleWhoApprove?.id}">${changeBoardApprovalInstance?.peopleWhoApprove?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeBoardApprovalInstance?.acceptance}">
				<li class="fieldcontain">
					<span id="acceptance-label" class="property-label"><g:message code="changeBoardApproval.acceptance.label" default="Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="acceptance-label"><g:formatBoolean boolean="${changeBoardApprovalInstance?.acceptance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeBoardApprovalInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="changeBoardApproval.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${changeBoardApprovalInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${changeBoardApprovalInstance?.id}" />
					<g:link class="edit" action="edit" id="${changeBoardApprovalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
