
<%@ page import="ProjectProcurementManagement.CloseProcurements.CloseProcurement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'closeProcurement.label', default: 'CloseProcurement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-closeProcurement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-closeProcurement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list closeProcurement">
			
				<g:if test="${closeProcurementInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="closeProcurement.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${closeProcurementInstance?.projectName?.id}">${closeProcurementInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${closeProcurementInstance?.materialName}">
				<li class="fieldcontain">
					<span id="materialName-label" class="property-label"><g:message code="closeProcurement.materialName.label" default="Material Name" /></span>
					
						<span class="property-value" aria-labelledby="materialName-label"><g:link controller="approval" action="show" id="${closeProcurementInstance?.materialName?.id}">${closeProcurementInstance?.materialName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${closeProcurementInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="closeProcurement.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${closeProcurementInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${closeProcurementInstance?.complete}">
				<li class="fieldcontain">
					<span id="complete-label" class="property-label"><g:message code="closeProcurement.complete.label" default="Complete" /></span>
					
						<span class="property-value" aria-labelledby="complete-label"><g:formatBoolean boolean="${closeProcurementInstance?.complete}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${closeProcurementInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="closeProcurement.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${closeProcurementInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${closeProcurementInstance?.id}" />
					<g:link class="edit" action="edit" id="${closeProcurementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
