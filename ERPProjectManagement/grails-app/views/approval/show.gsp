
<%@ page import="ProjectProcurementManagement.PlanProcurement.Approval" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'approval.label', default: 'Approval')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-approval" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-approval" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list approval">
			
				<g:if test="${approvalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="approval.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${approvalInstance?.projectName?.id}">${approvalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.dateApproval}">
				<li class="fieldcontain">
					<span id="dateApproval-label" class="property-label"><g:message code="approval.dateApproval.label" default="Date Approval" /></span>
					
						<span class="property-value" aria-labelledby="dateApproval-label"><g:formatDate date="${approvalInstance?.dateApproval}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.materialName}">
				<li class="fieldcontain">
					<span id="materialName-label" class="property-label"><g:message code="approval.materialName.label" default="Material Name" /></span>
					
						<span class="property-value" aria-labelledby="materialName-label"><g:link controller="requirementProcurement" action="show" id="${approvalInstance?.materialName?.id}">${approvalInstance?.materialName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.stakeholderRegister}">
				<li class="fieldcontain">
					<span id="stakeholderRegister-label" class="property-label"><g:message code="approval.stakeholderRegister.label" default="Stakeholder Register" /></span>
					
						<span class="property-value" aria-labelledby="stakeholderRegister-label"><g:link controller="stakeholderRegister" action="show" id="${approvalInstance?.stakeholderRegister?.id}">${approvalInstance?.stakeholderRegister?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.accepted}">
				<li class="fieldcontain">
					<span id="accepted-label" class="property-label"><g:message code="approval.accepted.label" default="Accepted" /></span>
					
						<span class="property-value" aria-labelledby="accepted-label"><g:formatBoolean boolean="${approvalInstance?.accepted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="approval.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${approvalInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${approvalInstance?.bidderSelected}">
				<li class="fieldcontain">
					<span id="bidderSelected-label" class="property-label"><g:message code="approval.bidderSelected.label" default="Bidder Selected" /></span>
					
						<g:each in="${approvalInstance.bidderSelected}" var="b">
						<span class="property-value" aria-labelledby="bidderSelected-label"><g:link controller="bidderSelected" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${approvalInstance?.id}" />
					<g:link class="edit" action="edit" id="${approvalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
