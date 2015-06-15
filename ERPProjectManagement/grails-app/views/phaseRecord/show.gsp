
<%@ page import="ProjectIntegrationManagement.CloseProjectOrPhase.PhaseRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'phaseRecord.label', default: 'PhaseRecord')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-phaseRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-phaseRecord" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list phaseRecord">
			
				<g:if test="${phaseRecordInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="phaseRecord.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${phaseRecordInstance?.projectName?.id}">${phaseRecordInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.projectSummary}">
				<li class="fieldcontain">
					<span id="projectSummary-label" class="property-label"><g:message code="phaseRecord.projectSummary.label" default="Project Summary" /></span>
					
						<span class="property-value" aria-labelledby="projectSummary-label"><g:fieldValue bean="${phaseRecordInstance}" field="projectSummary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.transitionToOperation}">
				<li class="fieldcontain">
					<span id="transitionToOperation-label" class="property-label"><g:message code="phaseRecord.transitionToOperation.label" default="Transition To Operation" /></span>
					
						<span class="property-value" aria-labelledby="transitionToOperation-label"><g:fieldValue bean="${phaseRecordInstance}" field="transitionToOperation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.projectCost}">
				<li class="fieldcontain">
					<span id="projectCost-label" class="property-label"><g:message code="phaseRecord.projectCost.label" default="Project Cost" /></span>
					
						<span class="property-value" aria-labelledby="projectCost-label"><g:fieldValue bean="${phaseRecordInstance}" field="projectCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.projectSchedule}">
				<li class="fieldcontain">
					<span id="projectSchedule-label" class="property-label"><g:message code="phaseRecord.projectSchedule.label" default="Project Schedule" /></span>
					
						<span class="property-value" aria-labelledby="projectSchedule-label"><g:fieldValue bean="${phaseRecordInstance}" field="projectSchedule"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.recommendations}">
				<li class="fieldcontain">
					<span id="recommendations-label" class="property-label"><g:message code="phaseRecord.recommendations.label" default="Recommendations" /></span>
					
						<span class="property-value" aria-labelledby="recommendations-label"><g:fieldValue bean="${phaseRecordInstance}" field="recommendations"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.acceptance}">
				<li class="fieldcontain">
					<span id="acceptance-label" class="property-label"><g:message code="phaseRecord.acceptance.label" default="Acceptance" /></span>
					
						<g:each in="${phaseRecordInstance.acceptance}" var="a">
						<span class="property-value" aria-labelledby="acceptance-label"><g:link controller="recordAcceptance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${phaseRecordInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="phaseRecord.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${phaseRecordInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${phaseRecordInstance?.id}" />
					<g:link class="edit" action="edit" id="${phaseRecordInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
