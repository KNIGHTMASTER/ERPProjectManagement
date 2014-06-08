
<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.WorkPerformanceInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workPerformanceInformation.label', default: 'WorkPerformanceInformation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workPerformanceInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workPerformanceInformation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workPerformanceInformation">
			
				<g:if test="${workPerformanceInformationInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="workPerformanceInformation.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${workPerformanceInformationInstance?.projectName?.id}">${workPerformanceInformationInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPerformanceInformationInstance?.dateEnding}">
				<li class="fieldcontain">
					<span id="dateEnding-label" class="property-label"><g:message code="workPerformanceInformation.dateEnding.label" default="Date Ending" /></span>
					
						<span class="property-value" aria-labelledby="dateEnding-label"><g:formatDate date="${workPerformanceInformationInstance?.dateEnding}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPerformanceInformationInstance?.workPlannedLastStep}">
				<li class="fieldcontain">
					<span id="workPlannedLastStep-label" class="property-label"><g:message code="workPerformanceInformation.workPlannedLastStep.label" default="Work Planned Last Step" /></span>
					
						<span class="property-value" aria-labelledby="workPlannedLastStep-label"><g:fieldValue bean="${workPerformanceInformationInstance}" field="workPlannedLastStep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPerformanceInformationInstance?.workCompletedLastStep}">
				<li class="fieldcontain">
					<span id="workCompletedLastStep-label" class="property-label"><g:message code="workPerformanceInformation.workCompletedLastStep.label" default="Work Completed Last Step" /></span>
					
						<span class="property-value" aria-labelledby="workCompletedLastStep-label"><g:fieldValue bean="${workPerformanceInformationInstance}" field="workCompletedLastStep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPerformanceInformationInstance?.workPlannedNextStep}">
				<li class="fieldcontain">
					<span id="workPlannedNextStep-label" class="property-label"><g:message code="workPerformanceInformation.workPlannedNextStep.label" default="Work Planned Next Step" /></span>
					
						<span class="property-value" aria-labelledby="workPlannedNextStep-label"><g:fieldValue bean="${workPerformanceInformationInstance}" field="workPlannedNextStep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workPerformanceInformationInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="workPerformanceInformation.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${workPerformanceInformationInstance?.activity?.id}">${workPerformanceInformationInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workPerformanceInformationInstance?.id}" />
					<g:link class="edit" action="edit" id="${workPerformanceInformationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
