
<%@ page import="ProjectCommunicationManagement.PlanCommunications.ProjectStakeholder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectStakeholder.label', default: 'ProjectStakeholder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectStakeholder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectStakeholder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectStakeholder">
			
				<g:if test="${projectStakeholderInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectStakeholder.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${projectStakeholderInstance?.projectName?.id}">${projectStakeholderInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStakeholderInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="projectStakeholder.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="stakeholderRoles" action="show" id="${projectStakeholderInstance?.role?.id}">${projectStakeholderInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStakeholderInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="projectStakeholder.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${projectStakeholderInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStakeholderInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="projectStakeholder.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${projectStakeholderInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStakeholderInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="projectStakeholder.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${projectStakeholderInstance}" field="department"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStakeholderInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="projectStakeholder.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${projectStakeholderInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStakeholderInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="projectStakeholder.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${projectStakeholderInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectStakeholderInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectStakeholderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
