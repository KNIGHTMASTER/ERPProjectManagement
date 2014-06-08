
<%@ page import="ProjectTimeManagement.DefineActivity.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-task" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list task">
			
				<g:if test="${taskInstance?.idProject}">
				<li class="fieldcontain">
					<span id="idProject-label" class="property-label"><g:message code="task.idProject.label" default="Id Project" /></span>
					
						<span class="property-value" aria-labelledby="idProject-label"><g:link controller="statementOfWork" action="show" id="${taskInstance?.idProject?.id}">${taskInstance?.idProject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.taskName}">
				<li class="fieldcontain">
					<span id="taskName-label" class="property-label"><g:message code="task.taskName.label" default="Task Name" /></span>
					
						<span class="property-value" aria-labelledby="taskName-label"><g:fieldValue bean="${taskInstance}" field="taskName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.descriptionOfWork}">
				<li class="fieldcontain">
					<span id="descriptionOfWork-label" class="property-label"><g:message code="task.descriptionOfWork.label" default="Description Of Work" /></span>
					
						<span class="property-value" aria-labelledby="descriptionOfWork-label"><g:fieldValue bean="${taskInstance}" field="descriptionOfWork"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="task.activity.label" default="Activity" /></span>
					
						<g:each in="${taskInstance.activity}" var="a">
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskInstance?.id}" />
					<g:link class="edit" action="edit" id="${taskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
