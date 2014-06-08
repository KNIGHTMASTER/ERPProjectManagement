
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectCharterApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectCharterApproval.label', default: 'ProjectCharterApproval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectCharterApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectCharterApproval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectCharterApproval">
			
				<g:if test="${projectCharterApprovalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectCharterApproval.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${projectCharterApprovalInstance?.projectName?.id}">${projectCharterApprovalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterApprovalInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="projectCharterApproval.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${projectCharterApprovalInstance?.stakeholder?.id}">${projectCharterApprovalInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterApprovalInstance?.projectCharter}">
				<li class="fieldcontain">
					<span id="projectCharter-label" class="property-label"><g:message code="projectCharterApproval.projectCharter.label" default="Project Charter" /></span>
					
						<span class="property-value" aria-labelledby="projectCharter-label"><g:link controller="projectCharter" action="show" id="${projectCharterApprovalInstance?.projectCharter?.id}">${projectCharterApprovalInstance?.projectCharter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterApprovalInstance?.acceptance}">
				<li class="fieldcontain">
					<span id="acceptance-label" class="property-label"><g:message code="projectCharterApproval.acceptance.label" default="Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="acceptance-label"><g:formatBoolean boolean="${projectCharterApprovalInstance?.acceptance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterApprovalInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="projectCharterApproval.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${projectCharterApprovalInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCharterApprovalInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="projectCharterApproval.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectCharterApprovalInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectCharterApprovalInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectCharterApprovalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
