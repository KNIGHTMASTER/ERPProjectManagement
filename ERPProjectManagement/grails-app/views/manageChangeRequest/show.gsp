
<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ManageChangeRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'manageChangeRequest.label', default: 'ManageChangeRequest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-manageChangeRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-manageChangeRequest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list manageChangeRequest">
			
				<g:if test="${manageChangeRequestInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="manageChangeRequest.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${manageChangeRequestInstance?.projectName?.id}">${manageChangeRequestInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.peopleWhoApprove}">
				<li class="fieldcontain">
					<span id="peopleWhoApprove-label" class="property-label"><g:message code="manageChangeRequest.peopleWhoApprove.label" default="People Who Approve" /></span>
					
						<g:each in="${manageChangeRequestInstance.peopleWhoApprove}" var="p">
						<span class="property-value" aria-labelledby="peopleWhoApprove-label"><g:link controller="changeControlBoard" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.changeRequests}">
				<li class="fieldcontain">
					<span id="changeRequests-label" class="property-label"><g:message code="manageChangeRequest.changeRequests.label" default="Change Requests" /></span>
					
						<g:each in="${manageChangeRequestInstance.changeRequests}" var="c">
						<span class="property-value" aria-labelledby="changeRequests-label"><g:link controller="changeRequest" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.varianceAnalysis}">
				<li class="fieldcontain">
					<span id="varianceAnalysis-label" class="property-label"><g:message code="manageChangeRequest.varianceAnalysis.label" default="Variance Analysis" /></span>
					
						<g:each in="${manageChangeRequestInstance.varianceAnalysis}" var="v">
						<span class="property-value" aria-labelledby="varianceAnalysis-label"><g:link controller="varianceAnalysis" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.dateRequested}">
				<li class="fieldcontain">
					<span id="dateRequested-label" class="property-label"><g:message code="manageChangeRequest.dateRequested.label" default="Date Requested" /></span>
					
						<span class="property-value" aria-labelledby="dateRequested-label"><g:formatDate date="${manageChangeRequestInstance?.dateRequested}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.dateApproved}">
				<li class="fieldcontain">
					<span id="dateApproved-label" class="property-label"><g:message code="manageChangeRequest.dateApproved.label" default="Date Approved" /></span>
					
						<span class="property-value" aria-labelledby="dateApproved-label"><g:formatDate date="${manageChangeRequestInstance?.dateApproved}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="manageChangeRequest.approval.label" default="Approval" /></span>
					
						<span class="property-value" aria-labelledby="approval-label"><g:formatBoolean boolean="${manageChangeRequestInstance?.approval}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="manageChangeRequest.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${manageChangeRequestInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${manageChangeRequestInstance?.recommendedAction}">
				<li class="fieldcontain">
					<span id="recommendedAction-label" class="property-label"><g:message code="manageChangeRequest.recommendedAction.label" default="Recommended Action" /></span>
					
						<span class="property-value" aria-labelledby="recommendedAction-label"><g:fieldValue bean="${manageChangeRequestInstance}" field="recommendedAction"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${manageChangeRequestInstance?.id}" />
					<g:link class="edit" action="edit" id="${manageChangeRequestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
