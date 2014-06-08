
<%@ page import="ProjectTimeManagement.Utility.Lagi" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lagi.label', default: 'Lagi')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lagi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lagi" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lagi">
			
				<g:if test="${lagiInstance?.idEmp}">
				<li class="fieldcontain">
					<span id="idEmp-label" class="property-label"><g:message code="lagi.idEmp.label" default="Id Emp" /></span>
					
						<span class="property-value" aria-labelledby="idEmp-label"><g:fieldValue bean="${lagiInstance}" field="idEmp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lagiInstance?.pro}">
				<li class="fieldcontain">
					<span id="pro-label" class="property-label"><g:message code="lagi.pro.label" default="Pro" /></span>
					
						<span class="property-value" aria-labelledby="pro-label"><g:fieldValue bean="${lagiInstance}" field="pro"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lagiInstance?.id}" />
					<g:link class="edit" action="edit" id="${lagiInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
