
<%@ page import="ProjectProcurementManagement.ConductProcurements.ProcurementNegotiation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'procurementNegotiation.label', default: 'ProcurementNegotiation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-procurementNegotiation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-procurementNegotiation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list procurementNegotiation">
			
				<g:if test="${procurementNegotiationInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="procurementNegotiation.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${procurementNegotiationInstance?.projectName?.id}">${procurementNegotiationInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementNegotiationInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="procurementNegotiation.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:link controller="performanceVendor" action="show" id="${procurementNegotiationInstance?.vendorName?.id}">${procurementNegotiationInstance?.vendorName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementNegotiationInstance?.policy}">
				<li class="fieldcontain">
					<span id="policy-label" class="property-label"><g:message code="procurementNegotiation.policy.label" default="Policy" /></span>
					
						<span class="property-value" aria-labelledby="policy-label"><g:fieldValue bean="${procurementNegotiationInstance}" field="policy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementNegotiationInstance?.lock}">
				<li class="fieldcontain">
					<span id="lock-label" class="property-label"><g:message code="procurementNegotiation.lock.label" default="Lock" /></span>
					
						<span class="property-value" aria-labelledby="lock-label"><g:formatBoolean boolean="${procurementNegotiationInstance?.lock}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${procurementNegotiationInstance?.unLock}">
				<li class="fieldcontain">
					<span id="unLock-label" class="property-label"><g:message code="procurementNegotiation.unLock.label" default="Un Lock" /></span>
					
						<span class="property-value" aria-labelledby="unLock-label"><g:formatBoolean boolean="${procurementNegotiationInstance?.unLock}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${procurementNegotiationInstance?.id}" />
					<g:link class="edit" action="edit" id="${procurementNegotiationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
