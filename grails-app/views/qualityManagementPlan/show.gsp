
<%@ page import="ProjectQualityManagement.QualityManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'qualityManagementPlan.label', default: 'QualityManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-qualityManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-qualityManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list qualityManagementPlan">
			
				<g:if test="${qualityManagementPlanInstance?.projectCharter}">
				<li class="fieldcontain">
					<span id="projectCharter-label" class="property-label"><g:message code="qualityManagementPlan.projectCharter.label" default="Project Charter" /></span>
					
						<span class="property-value" aria-labelledby="projectCharter-label"><g:link controller="projectCharter" action="show" id="${qualityManagementPlanInstance?.projectCharter?.id}">${qualityManagementPlanInstance?.projectCharter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityManagementPlanInstance?.qualityAssuranceApproach}">
				<li class="fieldcontain">
					<span id="qualityAssuranceApproach-label" class="property-label"><g:message code="qualityManagementPlan.qualityAssuranceApproach.label" default="Quality Assurance Approach" /></span>
					
						<span class="property-value" aria-labelledby="qualityAssuranceApproach-label"><g:fieldValue bean="${qualityManagementPlanInstance}" field="qualityAssuranceApproach"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${qualityManagementPlanInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="qualityManagementPlan.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${qualityManagementPlanInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${qualityManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${qualityManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
