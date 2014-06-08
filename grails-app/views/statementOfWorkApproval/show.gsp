
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.StatementOfWorkApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statementOfWorkApproval.label', default: 'StatementOfWorkApproval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-statementOfWorkApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-statementOfWorkApproval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list statementOfWorkApproval">
			
				<g:if test="${statementOfWorkApprovalInstance?.statementOfWork}">
				<li class="fieldcontain">
					<span id="statementOfWork-label" class="property-label"><g:message code="statementOfWorkApproval.statementOfWork.label" default="Statement Of Work" /></span>
					
						<span class="property-value" aria-labelledby="statementOfWork-label"><g:link controller="statementOfWork" action="show" id="${statementOfWorkApprovalInstance?.statementOfWork?.id}">${statementOfWorkApprovalInstance?.statementOfWork?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkApprovalInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="statementOfWorkApproval.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${statementOfWorkApprovalInstance?.stakeholder?.id}">${statementOfWorkApprovalInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkApprovalInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="statementOfWorkApproval.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:formatBoolean boolean="${statementOfWorkApprovalInstance?.approval}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkApprovalInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="statementOfWorkApproval.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${statementOfWorkApprovalInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statementOfWorkApprovalInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="statementOfWorkApproval.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${statementOfWorkApprovalInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${statementOfWorkApprovalInstance?.id}" />
					<g:link class="edit" action="edit" id="${statementOfWorkApprovalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
