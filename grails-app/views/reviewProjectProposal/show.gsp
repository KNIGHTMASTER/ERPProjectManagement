
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ReviewProjectProposal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reviewProjectProposal.label', default: 'ReviewProjectProposal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reviewProjectProposal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reviewProjectProposal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reviewProjectProposal">
			
				<g:if test="${reviewProjectProposalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="reviewProjectProposal.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${reviewProjectProposalInstance?.projectName?.id}">${reviewProjectProposalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewProjectProposalInstance?.reviewer}">
				<li class="fieldcontain">
					<span id="reviewer-label" class="property-label"><g:message code="reviewProjectProposal.reviewer.label" default="Reviewer" /></span>
					
						<span class="property-value" aria-labelledby="reviewer-label"><g:link controller="stakeholderRegister" action="show" id="${reviewProjectProposalInstance?.reviewer?.id}">${reviewProjectProposalInstance?.reviewer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewProjectProposalInstance?.projectStatus}">
				<li class="fieldcontain">
					<span id="projectStatus-label" class="property-label"><g:message code="reviewProjectProposal.projectStatus.label" default="Project Status" /></span>
					
						<span class="property-value" aria-labelledby="projectStatus-label"><g:fieldValue bean="${reviewProjectProposalInstance}" field="projectStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewProjectProposalInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="reviewProjectProposal.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${reviewProjectProposalInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewProjectProposalInstance?.acceptance}">
				<li class="fieldcontain">
					<span id="acceptance-label" class="property-label"><g:message code="reviewProjectProposal.acceptance.label" default="Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="acceptance-label"><g:formatBoolean boolean="${reviewProjectProposalInstance?.acceptance}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reviewProjectProposalInstance?.id}" />
					<g:link class="edit" action="edit" id="${reviewProjectProposalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
