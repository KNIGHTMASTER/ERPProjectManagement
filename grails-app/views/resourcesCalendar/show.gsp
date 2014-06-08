
<%@ page import="ProjectTimeManagement.EstimateResourceActivity.ResourcesCalendar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resourcesCalendar.label', default: 'ResourcesCalendar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-resourcesCalendar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-resourcesCalendar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list resourcesCalendar">
			
				<g:if test="${resourcesCalendarInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="resourcesCalendar.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${resourcesCalendarInstance?.employee?.id}">${resourcesCalendarInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourcesCalendarInstance?.activeDate}">
				<li class="fieldcontain">
					<span id="activeDate-label" class="property-label"><g:message code="resourcesCalendar.activeDate.label" default="Active Date" /></span>
					
						<span class="property-value" aria-labelledby="activeDate-label"><g:formatDate date="${resourcesCalendarInstance?.activeDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourcesCalendarInstance?.inactiveDate}">
				<li class="fieldcontain">
					<span id="inactiveDate-label" class="property-label"><g:message code="resourcesCalendar.inactiveDate.label" default="Inactive Date" /></span>
					
						<span class="property-value" aria-labelledby="inactiveDate-label"><g:formatDate date="${resourcesCalendarInstance?.inactiveDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${resourcesCalendarInstance?.id}" />
					<g:link class="edit" action="edit" id="${resourcesCalendarInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
