
<%@ page import="ProjectTimeManagement.DefineActivity.ProjectCalendar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectCalendar.label', default: 'ProjectCalendar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectCalendar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectCalendar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectCalendar">
			
				<g:if test="${projectCalendarInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="projectCalendar.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="statementOfWork" action="show" id="${projectCalendarInstance?.project?.id}">${projectCalendarInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCalendarInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="projectCalendar.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${projectCalendarInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCalendarInstance?.dayType}">
				<li class="fieldcontain">
					<span id="dayType-label" class="property-label"><g:message code="projectCalendar.dayType.label" default="Day Type" /></span>
					
						<span class="property-value" aria-labelledby="dayType-label"><g:fieldValue bean="${projectCalendarInstance}" field="dayType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCalendarInstance?.workTime}">
				<li class="fieldcontain">
					<span id="workTime-label" class="property-label"><g:message code="projectCalendar.workTime.label" default="Work Time" /></span>
					
						<span class="property-value" aria-labelledby="workTime-label"><g:fieldValue bean="${projectCalendarInstance}" field="workTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCalendarInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="projectCalendar.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${projectCalendarInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectCalendarInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="projectCalendar.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectCalendarInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectCalendarInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectCalendarInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
