
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">
			
				<g:if test="${customerInstance?.nAcceptedVendor}">
				<li class="fieldcontain">
					<span id="nAcceptedVendor-label" class="property-label"><g:message code="customer.nAcceptedVendor.label" default="NA ccepted Vendor" /></span>
					
						<span class="property-value" aria-labelledby="nAcceptedVendor-label"><g:fieldValue bean="${customerInstance}" field="nAcceptedVendor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.nComplain}">
				<li class="fieldcontain">
					<span id="nComplain-label" class="property-label"><g:message code="customer.nComplain.label" default="NC omplain" /></span>
					
						<span class="property-value" aria-labelledby="nComplain-label"><g:fieldValue bean="${customerInstance}" field="nComplain"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.nStakeholder}">
				<li class="fieldcontain">
					<span id="nStakeholder-label" class="property-label"><g:message code="customer.nStakeholder.label" default="NS takeholder" /></span>
					
						<span class="property-value" aria-labelledby="nStakeholder-label"><g:fieldValue bean="${customerInstance}" field="nStakeholder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerInstance?.nVendor}">
				<li class="fieldcontain">
					<span id="nVendor-label" class="property-label"><g:message code="customer.nVendor.label" default="NV endor" /></span>
					
						<span class="property-value" aria-labelledby="nVendor-label"><g:fieldValue bean="${customerInstance}" field="nVendor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerInstance?.id}" />
					<g:link class="edit" action="edit" id="${customerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
