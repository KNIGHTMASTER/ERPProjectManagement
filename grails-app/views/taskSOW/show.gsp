
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.TaskSOW" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'taskSOW.label', default: 'TaskSOW')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-taskSOW" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-taskSOW" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list taskSOW">
			
				<g:if test="${taskSOWInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="taskSOW.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${taskSOWInstance?.projectName?.id}">${taskSOWInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskSOWInstance?.workRequirement}">
				<li class="fieldcontain">
					<span id="workRequirement-label" class="property-label"><g:message code="taskSOW.workRequirement.label" default="Work Requirement" /></span>
					
						<span class="property-value" aria-labelledby="workRequirement-label"><g:link controller="workRequirements" action="show" id="${taskSOWInstance?.workRequirement?.id}">${taskSOWInstance?.workRequirement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskSOWInstance?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="taskSOW.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:fieldValue bean="${taskSOWInstance}" field="task"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskSOWInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="taskSOW.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${taskSOWInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskSOWInstance?.id}" />
					<g:link class="edit" action="edit" id="${taskSOWInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
