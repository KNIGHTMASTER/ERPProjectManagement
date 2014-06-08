
<%@ page import="ProjectIntegrationManagement.DirectAndManageProjectExecution.ProjectStatus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'projectStatus.label', default: 'ProjectStatus')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-projectStatus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-projectStatus" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list projectStatus">
			
				<g:if test="${projectStatusInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="projectStatus.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${projectStatusInstance?.projectName?.id}">${projectStatusInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStatusInstance?.workPerformanceInformation}">
				<li class="fieldcontain">
					<span id="workPerformanceInformation-label" class="property-label"><g:message code="projectStatus.workPerformanceInformation.label" default="Work Performance Information" /></span>
					
						<span class="property-value" aria-labelledby="workPerformanceInformation-label"><g:link controller="workPerformanceInformation" action="show" id="${projectStatusInstance?.workPerformanceInformation?.id}">${projectStatusInstance?.workPerformanceInformation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStatusInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="projectStatus.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:fieldValue bean="${projectStatusInstance}" field="item"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStatusInstance?.bad}">
				<li class="fieldcontain">
					<span id="bad-label" class="property-label"><g:message code="projectStatus.bad.label" default="Bad" /></span>
					
						<span class="property-value" aria-labelledby="bad-label"><g:fieldValue bean="${projectStatusInstance}" field="bad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStatusInstance?.good}">
				<li class="fieldcontain">
					<span id="good-label" class="property-label"><g:message code="projectStatus.good.label" default="Good" /></span>
					
						<span class="property-value" aria-labelledby="good-label"><g:fieldValue bean="${projectStatusInstance}" field="good"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectStatusInstance?.excellent}">
				<li class="fieldcontain">
					<span id="excellent-label" class="property-label"><g:message code="projectStatus.excellent.label" default="Excellent" /></span>
					
						<span class="property-value" aria-labelledby="excellent-label"><g:fieldValue bean="${projectStatusInstance}" field="excellent"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectStatusInstance?.id}" />
					<g:link class="edit" action="edit" id="${projectStatusInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
