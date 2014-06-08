
<%@ page import="ProjectScopeManagement.VerifyScope.Inspection" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inspection.label', default: 'Inspection')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inspection" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inspection" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inspection">
			
				<g:if test="${inspectionInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="inspection.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${inspectionInstance?.projectName?.id}">${inspectionInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.deliverable}">
				<li class="fieldcontain">
					<span id="deliverable-label" class="property-label"><g:message code="inspection.deliverable.label" default="Deliverable" /></span>
					
						<span class="property-value" aria-labelledby="deliverable-label"><g:link controller="projectDeliverable" action="show" id="${inspectionInstance?.deliverable?.id}">${inspectionInstance?.deliverable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.decision}">
				<li class="fieldcontain">
					<span id="decision-label" class="property-label"><g:message code="inspection.decision.label" default="Decision" /></span>
					
						<span class="property-value" aria-labelledby="decision-label"><g:fieldValue bean="${inspectionInstance}" field="decision"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.realization}">
				<li class="fieldcontain">
					<span id="realization-label" class="property-label"><g:message code="inspection.realization.label" default="Realization" /></span>
					
						<span class="property-value" aria-labelledby="realization-label"><g:fieldValue bean="${inspectionInstance}" field="realization"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inspectionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="inspection.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${inspectionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${inspectionInstance?.id}" />
					<g:link class="edit" action="edit" id="${inspectionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
