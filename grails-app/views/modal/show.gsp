
<%@ page import="ProjectCostManagement.DetermineBudget.Modal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modal.label', default: 'Modal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-modal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-modal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list modal">
			
				<g:if test="${modalInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="modal.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${modalInstance?.projectName?.id}">${modalInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${modalInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="modal.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${modalInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modalInstance?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="modal.source.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${modalInstance}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${modalInstance?.datePayment}">
				<li class="fieldcontain">
					<span id="datePayment-label" class="property-label"><g:message code="modal.datePayment.label" default="Date Payment" /></span>
					
						<span class="property-value" aria-labelledby="datePayment-label"><g:formatDate date="${modalInstance?.datePayment}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${modalInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="modal.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${modalInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${modalInstance?.id}" />
					<g:link class="edit" action="edit" id="${modalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
