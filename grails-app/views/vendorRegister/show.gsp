
<%@ page import="ProjectProcurementManagement.ConductProcurements.VendorRegister" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vendorRegister.label', default: 'VendorRegister')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vendorRegister" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vendorRegister" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vendorRegister">
			
				<g:if test="${vendorRegisterInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="vendorRegister.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${vendorRegisterInstance?.projectName?.id}">${vendorRegisterInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorRegisterInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="vendorRegister.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:link controller="performanceVendor" action="show" id="${vendorRegisterInstance?.vendorName?.id}">${vendorRegisterInstance?.vendorName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorRegisterInstance?.companyType}">
				<li class="fieldcontain">
					<span id="companyType-label" class="property-label"><g:message code="vendorRegister.companyType.label" default="Company Type" /></span>
					
						<span class="property-value" aria-labelledby="companyType-label"><g:fieldValue bean="${vendorRegisterInstance}" field="companyType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vendorRegisterInstance?.dateRegister}">
				<li class="fieldcontain">
					<span id="dateRegister-label" class="property-label"><g:message code="vendorRegister.dateRegister.label" default="Date Register" /></span>
					
						<span class="property-value" aria-labelledby="dateRegister-label"><g:formatDate date="${vendorRegisterInstance?.dateRegister}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vendorRegisterInstance?.id}" />
					<g:link class="edit" action="edit" id="${vendorRegisterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
