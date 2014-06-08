
<%@ page import="ProjectIntegrationManagement.PerformIntegratedChangeControl.ChangeRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeRequest.label', default: 'ChangeRequestCommunication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-changeRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-changeRequest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list changeRequest">
			
				<g:if test="${changeRequestInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="changeRequest.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${changeRequestInstance?.projectName?.id}">${changeRequestInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.dateRequested}">
				<li class="fieldcontain">
					<span id="dateRequested-label" class="property-label"><g:message code="changeRequest.dateRequested.label" default="Date Requested" /></span>
					
						<span class="property-value" aria-labelledby="dateRequested-label"><g:formatDate date="${changeRequestInstance?.dateRequested}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.changeRequestor}">
				<li class="fieldcontain">
					<span id="changeRequestor-label" class="property-label"><g:message code="changeRequest.changeRequestor.label" default="Change Requestor" /></span>
					
						<span class="property-value" aria-labelledby="changeRequestor-label"><g:link controller="stakeholderRegister" action="show" id="${changeRequestInstance?.changeRequestor?.id}">${changeRequestInstance?.changeRequestor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.changeCategory}">
				<li class="fieldcontain">
					<span id="changeCategory-label" class="property-label"><g:message code="changeRequest.changeCategory.label" default="Change Category" /></span>
					
						<span class="property-value" aria-labelledby="changeCategory-label"><g:fieldValue bean="${changeRequestInstance}" field="changeCategory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.changeAffect}">
				<li class="fieldcontain">
					<span id="changeAffect-label" class="property-label"><g:message code="changeRequest.changeAffect.label" default="Change Affect" /></span>
					
						<span class="property-value" aria-labelledby="changeAffect-label"><g:fieldValue bean="${changeRequestInstance}" field="changeAffect"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.changeRequested}">
				<li class="fieldcontain">
					<span id="changeRequested-label" class="property-label"><g:message code="changeRequest.changeRequested.label" default="Change Requested" /></span>
					
						<span class="property-value" aria-labelledby="changeRequested-label"><g:fieldValue bean="${changeRequestInstance}" field="changeRequested"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.reasonForChange}">
				<li class="fieldcontain">
					<span id="reasonForChange-label" class="property-label"><g:message code="changeRequest.reasonForChange.label" default="Reason For Change" /></span>
					
						<span class="property-value" aria-labelledby="reasonForChange-label"><g:fieldValue bean="${changeRequestInstance}" field="reasonForChange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.alternativeConsidered}">
				<li class="fieldcontain">
					<span id="alternativeConsidered-label" class="property-label"><g:message code="changeRequest.alternativeConsidered.label" default="Alternative Considered" /></span>
					
						<span class="property-value" aria-labelledby="alternativeConsidered-label"><g:fieldValue bean="${changeRequestInstance}" field="alternativeConsidered"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.requiredTechnicalChange}">
				<li class="fieldcontain">
					<span id="requiredTechnicalChange-label" class="property-label"><g:message code="changeRequest.requiredTechnicalChange.label" default="Required Technical Change" /></span>
					
						<span class="property-value" aria-labelledby="requiredTechnicalChange-label"><g:fieldValue bean="${changeRequestInstance}" field="requiredTechnicalChange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.riskForTheChange}">
				<li class="fieldcontain">
					<span id="riskForTheChange-label" class="property-label"><g:message code="changeRequest.riskForTheChange.label" default="Risk For The Change" /></span>
					
						<span class="property-value" aria-labelledby="riskForTheChange-label"><g:fieldValue bean="${changeRequestInstance}" field="riskForTheChange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.estimatedCostNeeded}">
				<li class="fieldcontain">
					<span id="estimatedCostNeeded-label" class="property-label"><g:message code="changeRequest.estimatedCostNeeded.label" default="Estimated Cost Needed" /></span>
					
						<span class="property-value" aria-labelledby="estimatedCostNeeded-label"><g:fieldValue bean="${changeRequestInstance}" field="estimatedCostNeeded"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.estimatedResourceNeeded}">
				<li class="fieldcontain">
					<span id="estimatedResourceNeeded-label" class="property-label"><g:message code="changeRequest.estimatedResourceNeeded.label" default="Estimated Resource Needed" /></span>
					
						<span class="property-value" aria-labelledby="estimatedResourceNeeded-label"><g:fieldValue bean="${changeRequestInstance}" field="estimatedResourceNeeded"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.implicationOfQuality}">
				<li class="fieldcontain">
					<span id="implicationOfQuality-label" class="property-label"><g:message code="changeRequest.implicationOfQuality.label" default="Implication Of Quality" /></span>
					
						<span class="property-value" aria-labelledby="implicationOfQuality-label"><g:fieldValue bean="${changeRequestInstance}" field="implicationOfQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeRequestInstance?.approvals}">
				<li class="fieldcontain">
					<span id="approvals-label" class="property-label"><g:message code="changeRequest.approvals.label" default="Approvals" /></span>
					
						<g:each in="${changeRequestInstance.approvals}" var="a">
						<span class="property-value" aria-labelledby="approvals-label"><g:link controller="changeBoardApproval" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${changeRequestInstance?.id}" />
					<g:link class="edit" action="edit" id="${changeRequestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
