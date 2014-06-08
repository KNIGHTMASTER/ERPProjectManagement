
<%@ page import="ProjectCostManagement.DetermineBudget.CostManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costManagementPlan.label', default: 'CostManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-costManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-costManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list costManagementPlan">
			
				<g:if test="${costManagementPlanInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="costManagementPlan.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${costManagementPlanInstance?.projectName?.id}">${costManagementPlanInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costManagementPlanInstance?.milestone}">
				<li class="fieldcontain">
					<span id="milestone-label" class="property-label"><g:message code="costManagementPlan.milestone.label" default="Milestone" /></span>
					
						<span class="property-value" aria-labelledby="milestone-label"><g:link controller="milestones" action="show" id="${costManagementPlanInstance?.milestone?.id}">${costManagementPlanInstance?.milestone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costManagementPlanInstance?.plannedValue}">
				<li class="fieldcontain">
					<span id="plannedValue-label" class="property-label"><g:message code="costManagementPlan.plannedValue.label" default="Planned Value" /></span>
					
						<span class="property-value" aria-labelledby="plannedValue-label"><g:fieldValue bean="${costManagementPlanInstance}" field="plannedValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costManagementPlanInstance?.approval}">
				<li class="fieldcontain">
					<span id="approval-label" class="property-label"><g:message code="costManagementPlan.approval.label" default="Approval" /></span>
					
						<g:each in="${costManagementPlanInstance.approval}" var="a">
						<span class="property-value" aria-labelledby="approval-label"><g:link controller="costApproval" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${costManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${costManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
