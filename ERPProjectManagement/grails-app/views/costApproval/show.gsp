
<%@ page import="ProjectCostManagement.CostApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costApproval.label', default: 'CostApproval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-costApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-costApproval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list costApproval">
			
				<g:if test="${costApprovalInstance?.costManagementPlan}">
				<li class="fieldcontain">
					<span id="costManagementPlan-label" class="property-label"><g:message code="costApproval.costManagementPlan.label" default="Cost Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="costManagementPlan-label"><g:link controller="costManagementPlan" action="show" id="${costApprovalInstance?.costManagementPlan?.id}">${costApprovalInstance?.costManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costApprovalInstance?.dateCreate}">
				<li class="fieldcontain">
					<span id="dateCreate-label" class="property-label"><g:message code="costApproval.dateCreate.label" default="Date Create" /></span>
					
						<span class="property-value" aria-labelledby="dateCreate-label"><g:formatDate date="${costApprovalInstance?.dateCreate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${costApprovalInstance?.accepted}">
				<li class="fieldcontain">
					<span id="accepted-label" class="property-label"><g:message code="costApproval.accepted.label" default="Accepted" /></span>
					
						<span class="property-value" aria-labelledby="accepted-label"><g:formatBoolean boolean="${costApprovalInstance?.accepted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${costApprovalInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="costApproval.stakeholder.label" default="Stakeholder" /></span>
					
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="employee" action="show" id="${costApprovalInstance?.stakeholder?.id}">${costApprovalInstance?.stakeholder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costApprovalInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="costApproval.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${costApprovalInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${costApprovalInstance?.id}" />
					<g:link class="edit" action="edit" id="${costApprovalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
