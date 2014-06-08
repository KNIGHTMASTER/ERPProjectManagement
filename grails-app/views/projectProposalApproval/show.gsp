
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ProjectProposalApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectProposalApproval.label', default: 'ProjectProposalApproval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectProposalApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectProposalApproval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectProposalApproval">
			
				<g:if test="${projectProposalApprovalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectProposalApproval.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${projectProposalApprovalInstance?.projectName?.id}">${projectProposalApprovalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalApprovalInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="projectProposalApproval.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${projectProposalApprovalInstance?.stakeholder?.id}">${projectProposalApprovalInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalApprovalInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="projectProposalApproval.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${projectProposalApprovalInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalApprovalInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="projectProposalApproval.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:formatBoolean boolean="${projectProposalApprovalInstance?.approval}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectProposalApprovalInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="projectProposalApproval.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${projectProposalApprovalInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectProposalApprovalInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectProposalApprovalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
