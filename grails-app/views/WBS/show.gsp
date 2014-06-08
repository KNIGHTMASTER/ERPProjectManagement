
<%@ page import="ProjectScopeManagement.CreateWBS.Wbs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wbs.label', default: 'Wbs')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wbs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wbs" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wbs">
			
				<g:if test="${wbsInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="wbs.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${wbsInstance?.projectName?.id}">${wbsInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsInstance?.milestoneType}">
				<li class="fieldcontain">
					<span id="milestoneType-label" class="property-label"><g:message code="wbs.milestoneType.label" default="Milestone Type" /></span>
					
						<span class="property-value" aria-labelledby="milestoneType-label"><g:link controller="milestoneType" action="show" id="${wbsInstance?.milestoneType?.id}">${wbsInstance?.milestoneType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsInstance?.deliverable}">
				<li class="fieldcontain">
					<span id="deliverable-label" class="property-label"><g:message code="wbs.deliverable.label" default="Deliverable" /></span>
					
						<span class="property-value" aria-labelledby="deliverable-label"><g:link controller="projectDeliverable" action="show" id="${wbsInstance?.deliverable?.id}">${wbsInstance?.deliverable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsInstance?.wbsName}">
				<li class="fieldcontain">
					<span id="wbsName-label" class="property-label"><g:message code="wbs.wbsName.label" default="Wbs Name" /></span>
					
						<span class="property-value" aria-labelledby="wbsName-label"><g:fieldValue bean="${wbsInstance}" field="wbsName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wbsInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="wbs.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${wbsInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wbsInstance?.id}" />
					<g:link class="edit" action="edit" id="${wbsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
