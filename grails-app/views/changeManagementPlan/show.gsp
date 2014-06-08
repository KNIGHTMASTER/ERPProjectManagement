
<%@ page import="ProjectIntegrationManagement.DevelopProjectManagementPlan.ChangeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'changeManagementPlan.label', default: 'ChangeManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-changeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-changeManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list changeManagementPlan">
			
				<g:if test="${changeManagementPlanInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="changeManagementPlan.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${changeManagementPlanInstance?.projectName?.id}">${changeManagementPlanInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeManagementPlanInstance?.changeManagementApproach}">
				<li class="fieldcontain">
					<span id="changeManagementApproach-label" class="property-label"><g:message code="changeManagementPlan.changeManagementApproach.label" default="Change Management Approach" /></span>
					
						<span class="property-value" aria-labelledby="changeManagementApproach-label">${changeManagementPlanInstance}</span>
				</li>
				</g:if>
			
				<g:if test="${changeManagementPlanInstance?.changeControlBoard}">
				<li class="fieldcontain">
					<span id="changeControlBoard-label" class="property-label"><g:message code="changeManagementPlan.changeControlBoard.label" default="Change Control Board" /></span>
					
						<g:each in="${changeManagementPlanInstance.changeControlBoard}" var="c">
						<span class="property-value" aria-labelledby="changeControlBoard-label"><g:link controller="changeControlBoard" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${changeManagementPlanInstance?.datePrepared}">
				<li class="fieldcontain">
					<span id="datePrepared-label" class="property-label"><g:message code="changeManagementPlan.datePrepared.label" default="Date Prepared" /></span>
					
						<span class="property-value" aria-labelledby="datePrepared-label"><g:formatDate date="${changeManagementPlanInstance?.datePrepared}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${changeManagementPlanInstance?.definitionsOfChange}">
				<li class="fieldcontain">
					<span id="definitionsOfChange-label" class="property-label"><g:message code="changeManagementPlan.definitionsOfChange.label" default="Definitions Of Change" /></span>
					
						<g:each in="${changeManagementPlanInstance.definitionsOfChange}" var="d">
						<span class="property-value" aria-labelledby="definitionsOfChange-label"><g:link controller="definitionsOfChange" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${changeManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${changeManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
