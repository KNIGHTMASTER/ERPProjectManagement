
<%@ page import="ProjectTimeManagement.DefineActivity.ActivityTracking" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityTracking.label', default: 'ActivityTracking')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityTracking" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityTracking" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityTracking">
			
				<g:if test="${activityTrackingInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="activityTracking.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityTrackingInstance?.activity?.id}">${activityTrackingInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTrackingInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="activityTracking.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${activityTrackingInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTrackingInstance?.doWork}">
				<li class="fieldcontain">
					<span id="doWork-label" class="property-label"><g:message code="activityTracking.doWork.label" default="Do Work" /></span>
					
						<span class="property-value" aria-labelledby="doWork-label"><g:fieldValue bean="${activityTrackingInstance}" field="doWork"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTrackingInstance?.complete}">
				<li class="fieldcontain">
					<span id="complete-label" class="property-label"><g:message code="activityTracking.complete.label" default="Complete" /></span>
					
						<span class="property-value" aria-labelledby="complete-label"><g:fieldValue bean="${activityTrackingInstance}" field="complete"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTrackingInstance?.hours}">
				<li class="fieldcontain">
					<span id="hours-label" class="property-label"><g:message code="activityTracking.hours.label" default="Hours" /></span>
					
						<span class="property-value" aria-labelledby="hours-label"><g:fieldValue bean="${activityTrackingInstance}" field="hours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityTrackingInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="activityTracking.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${activityTrackingInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityTrackingInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityTrackingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
