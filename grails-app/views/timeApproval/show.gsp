
<%@ page import="ProjectTimeManagement.DevelopSchedule.TimeApproval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'timeApproval.label', default: 'TimeApproval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-timeApproval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-timeApproval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list timeApproval">
			
				<g:if test="${timeApprovalInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="timeApproval.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${timeApprovalInstance?.activity?.id}">${timeApprovalInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeApprovalInstance?.accepted}">
				<li class="fieldcontain">
					<span id="accepted-label" class="property-label"><g:message code="timeApproval.accepted.label" default="Accepted" /></span>
					
						<span class="property-value" aria-labelledby="accepted-label"><g:formatBoolean boolean="${timeApprovalInstance?.accepted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeApprovalInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="timeApproval.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${timeApprovalInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${timeApprovalInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="timeApproval.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="employee" action="show" id="${timeApprovalInstance?.role?.id}">${timeApprovalInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${timeApprovalInstance?.id}" />
					<g:link class="edit" action="edit" id="${timeApprovalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
