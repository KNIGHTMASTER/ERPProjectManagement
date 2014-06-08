
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.MilestoneSOW" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'milestoneSOW.label', default: 'MilestoneSOW')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-milestoneSOW" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-milestoneSOW" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list milestoneSOW">
			
				<g:if test="${milestoneSOWInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="milestoneSOW.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="statementOfWork" action="show" id="${milestoneSOWInstance?.projectName?.id}">${milestoneSOWInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestoneSOWInstance?.milestoneName}">
				<li class="fieldcontain">
					<span id="milestoneName-label" class="property-label"><g:message code="milestoneSOW.milestoneName.label" default="Milestone Name" /></span>
					
						<span class="property-value" aria-labelledby="milestoneName-label"><g:fieldValue bean="${milestoneSOWInstance}" field="milestoneName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${milestoneSOWInstance?.dueDate}">
				<li class="fieldcontain">
					<span id="dueDate-label" class="property-label"><g:message code="milestoneSOW.dueDate.label" default="Due Date" /></span>
					
						<span class="property-value" aria-labelledby="dueDate-label"><g:formatDate date="${milestoneSOWInstance?.dueDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${milestoneSOWInstance?.id}" />
					<g:link class="edit" action="edit" id="${milestoneSOWInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
