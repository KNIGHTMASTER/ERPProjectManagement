
<%@ page import="ProjectCommunicationManagement.DistributeInformation.DistributeInformation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'distributeInformation.label', default: 'DistributeInformation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-distributeInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-distributeInformation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list distributeInformation">
			
				<g:if test="${distributeInformationInstance?.projectCharter}">
				<li class="fieldcontain">
					<span id="projectCharter-label" class="property-label"><g:message code="distributeInformation.projectCharter.label" default="Project Charter" /></span>
					
						<span class="property-value" aria-labelledby="projectCharter-label"><g:link controller="projectCharter" action="show" id="${distributeInformationInstance?.projectCharter?.id}">${distributeInformationInstance?.projectCharter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.activityTracking}">
				<li class="fieldcontain">
					<span id="activityTracking-label" class="property-label"><g:message code="distributeInformation.activityTracking.label" default="Activity Tracking" /></span>
					
						<span class="property-value" aria-labelledby="activityTracking-label"><g:link controller="activityTracking" action="show" id="${distributeInformationInstance?.activityTracking?.id}">${distributeInformationInstance?.activityTracking?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.stakeholder}">
				<li class="fieldcontain">
					<span id="stakeholder-label" class="property-label"><g:message code="distributeInformation.stakeholder.label" default="Stakeholder" /></span>
					
						<g:each in="${distributeInformationInstance.stakeholder}" var="s">
						<span class="property-value" aria-labelledby="stakeholder-label"><g:link controller="stakeholderRegister" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="distributeInformation.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${distributeInformationInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.workPlannedLastActivity}">
				<li class="fieldcontain">
					<span id="workPlannedLastActivity-label" class="property-label"><g:message code="distributeInformation.workPlannedLastActivity.label" default="Work Planned Last Activity" /></span>
					
						<span class="property-value" aria-labelledby="workPlannedLastActivity-label"><g:fieldValue bean="${distributeInformationInstance}" field="workPlannedLastActivity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.workPlannedNextActivity}">
				<li class="fieldcontain">
					<span id="workPlannedNextActivity-label" class="property-label"><g:message code="distributeInformation.workPlannedNextActivity.label" default="Work Planned Next Activity" /></span>
					
						<span class="property-value" aria-labelledby="workPlannedNextActivity-label"><g:fieldValue bean="${distributeInformationInstance}" field="workPlannedNextActivity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.openIssues}">
				<li class="fieldcontain">
					<span id="openIssues-label" class="property-label"><g:message code="distributeInformation.openIssues.label" default="Open Issues" /></span>
					
						<span class="property-value" aria-labelledby="openIssues-label"><g:fieldValue bean="${distributeInformationInstance}" field="openIssues"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.openRisks}">
				<li class="fieldcontain">
					<span id="openRisks-label" class="property-label"><g:message code="distributeInformation.openRisks.label" default="Open Risks" /></span>
					
						<span class="property-value" aria-labelledby="openRisks-label"><g:fieldValue bean="${distributeInformationInstance}" field="openRisks"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${distributeInformationInstance?.distribute}">
				<li class="fieldcontain">
					<span id="distribute-label" class="property-label"><g:message code="distributeInformation.distribute.label" default="Distribute" /></span>
					
						<span class="property-value" aria-labelledby="distribute-label"><g:formatBoolean boolean="${distributeInformationInstance?.distribute}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${distributeInformationInstance?.id}" />
					<g:link class="edit" action="edit" id="${distributeInformationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
