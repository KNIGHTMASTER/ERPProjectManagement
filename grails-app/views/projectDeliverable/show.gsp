
<%@ page import="ProjectScopeManagement.DefineScope.ProjectDeliverable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectDeliverable.label', default: 'ProjectDeliverable')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectDeliverable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectDeliverable" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectDeliverable">
			
				<g:if test="${projectDeliverableInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectDeliverable.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${projectDeliverableInstance?.projectName?.id}">${projectDeliverableInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectDeliverableInstance?.milestones}">
				<li class="fieldcontain">
					<span id="milestones-label" class="property-label"><g:message code="projectDeliverable.milestones.label" default="Milestones" /></span>
					
						<span class="property-value" aria-labelledby="milestones-label"><g:link controller="milestones" action="show" id="${projectDeliverableInstance?.milestones?.id}">${projectDeliverableInstance?.milestones?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectDeliverableInstance?.deliverable}">
				<li class="fieldcontain">
					<span id="deliverable-label" class="property-label"><g:message code="projectDeliverable.deliverable.label" default="Deliverable" /></span>
					
						<span class="property-value" aria-labelledby="deliverable-label"><g:fieldValue bean="${projectDeliverableInstance}" field="deliverable"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectDeliverableInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectDeliverableInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
