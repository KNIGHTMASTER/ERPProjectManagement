
<%@ page import="ProjectProcurementManagement.AdministerProcurements.MaterialResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materialResource.label', default: 'MaterialResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materialResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materialResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materialResource">
			
				<g:if test="${materialResourceInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="materialResource.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${materialResourceInstance?.projectName?.id}">${materialResourceInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialResourceInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="materialResource.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${materialResourceInstance?.activity?.id}">${materialResourceInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialResourceInstance?.material}">
				<li class="fieldcontain">
					<span id="material-label" class="property-label"><g:message code="materialResource.material.label" default="Material" /></span>
					
						<span class="property-value" aria-labelledby="material-label"><g:fieldValue bean="${materialResourceInstance}" field="material"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialResourceInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="materialResource.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${materialResourceInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialResourceInstance?.available}">
				<li class="fieldcontain">
					<span id="available-label" class="property-label"><g:message code="materialResource.available.label" default="Available" /></span>
					
						<span class="property-value" aria-labelledby="available-label"><g:fieldValue bean="${materialResourceInstance}" field="available"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialResourceInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="materialResource.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${materialResourceInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialResourceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="materialResource.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${materialResourceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materialResourceInstance?.id}" />
					<g:link class="edit" action="edit" id="${materialResourceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
