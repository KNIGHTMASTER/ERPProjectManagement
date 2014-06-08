
<%@ page import="ProjectHumanResourceManagement.Emphoto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'emphoto.label', default: 'Emphoto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-emphoto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/schedule"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-emphoto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list emphoto">
			
				<g:if test="${emphotoInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="emphoto.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${emphotoInstance?.employee?.id}">${emphotoInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${emphotoInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="emphoto.photo.label" default="Photo" /></span>
					<span class="property-value" aria-labelledby="alamat-label"><img src="${createLink(controller:'emphoto',action:'tampil',id:emphotoInstance.id)}" width="150" height="200" /></span>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${emphotoInstance?.id}" />
					<g:link class="edit" action="edit" id="${emphotoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
