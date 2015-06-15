
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Perspektif" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perspektif.label', default: 'Perspektif')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-perspektif" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-perspektif" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list perspektif">
			
				<g:if test="${perspektifInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="perspektif.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${perspektifInstance?.projectName?.id}">${perspektifInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${perspektifInstance?.data1}">
				<li class="fieldcontain">
					<span id="data1-label" class="property-label"><g:message code="perspektif.data1.label" default="Data1" /></span>
					
						<span class="property-value" aria-labelledby="data1-label"><g:fieldValue bean="${perspektifInstance}" field="data1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perspektifInstance?.data2}">
				<li class="fieldcontain">
					<span id="data2-label" class="property-label"><g:message code="perspektif.data2.label" default="Data2" /></span>
					
						<span class="property-value" aria-labelledby="data2-label"><g:fieldValue bean="${perspektifInstance}" field="data2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perspektifInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="perspektif.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${perspektifInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${perspektifInstance?.id}" />
					<g:link class="edit" action="edit" id="${perspektifInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
