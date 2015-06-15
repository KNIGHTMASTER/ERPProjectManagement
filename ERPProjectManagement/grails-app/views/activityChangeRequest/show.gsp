
<%@ page import="ProjectTimeManagement.Utility.ActivityChangeRequest" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityChangeRequest.label', default: 'ActivityChangeRequest')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityChangeRequest" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activityChangeRequest" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activityChangeRequest">
			
				<g:if test="${activityChangeRequestInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="activityChangeRequest.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityChangeRequestInstance?.activity?.id}">${activityChangeRequestInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityChangeRequestInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="activityChangeRequest.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${activityChangeRequestInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activityChangeRequestInstance?.changeDate}">
				<li class="fieldcontain">
					<span id="changeDate-label" class="property-label"><g:message code="activityChangeRequest.changeDate.label" default="Change Date" /></span>
					
						<span class="property-value" aria-labelledby="changeDate-label"><g:formatDate date="${activityChangeRequestInstance?.changeDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityChangeRequestInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityChangeRequestInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
