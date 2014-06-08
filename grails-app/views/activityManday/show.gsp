
<%@ page import="ProjectTimeManagement.EstimateResourceActivity.ActivityManday" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityManday.label', default: 'ActivityManday')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityManday" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityManday" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityManday">
			
				<g:if test="${activityMandayInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="activityManday.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${activityMandayInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="activityManday.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityMandayInstance?.activity?.id}">${activityMandayInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="activityManday.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${activityMandayInstance?.employee?.id}">${activityMandayInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.doWork}">
				<li class="fieldcontain">
					<span id="doWork-label" class="property-label"><g:message code="activityManday.doWork.label" default="Do Work" /></span>
					
						<span class="property-value" aria-labelledby="doWork-label"><g:fieldValue bean="${activityMandayInstance}" field="doWork"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="activityManday.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${activityMandayInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.startWorks}">
				<li class="fieldcontain">
					<span id="startWorks-label" class="property-label"><g:message code="activityManday.startWorks.label" default="Start Works" /></span>
					
						<span class="property-value" aria-labelledby="startWorks-label"><g:formatDate date="${activityMandayInstance?.startWorks}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.endWorks}">
				<li class="fieldcontain">
					<span id="endWorks-label" class="property-label"><g:message code="activityManday.endWorks.label" default="End Works" /></span>
					
						<span class="property-value" aria-labelledby="endWorks-label"><g:formatDate date="${activityMandayInstance?.endWorks}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityMandayInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="activityManday.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${activityMandayInstance?.active}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityMandayInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityMandayInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
