
<%@ page import="ProjectProcurementManagement.ConductProcurements.BidderSelected" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bidderSelected.label', default: 'BidderSelected')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bidderSelected" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bidderSelected" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bidderSelected">
			
				<g:if test="${bidderSelectedInstance?.vendorName}">
				<li class="fieldcontain">
					<span id="vendorName-label" class="property-label"><g:message code="bidderSelected.vendorName.label" default="Vendor Name" /></span>
					
						<span class="property-value" aria-labelledby="vendorName-label"><g:link controller="vendorRegister" action="show" id="${bidderSelectedInstance?.vendorName?.id}">${bidderSelectedInstance?.vendorName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidderSelectedInstance?.materialName}">
				<li class="fieldcontain">
					<span id="materialName-label" class="property-label"><g:message code="bidderSelected.materialName.label" default="Material Name" /></span>
					
						<span class="property-value" aria-labelledby="materialName-label"><g:link controller="approval" action="show" id="${bidderSelectedInstance?.materialName?.id}">${bidderSelectedInstance?.materialName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidderSelectedInstance?.dateSelected}">
				<li class="fieldcontain">
					<span id="dateSelected-label" class="property-label"><g:message code="bidderSelected.dateSelected.label" default="Date Selected" /></span>
					
						<span class="property-value" aria-labelledby="dateSelected-label"><g:formatDate date="${bidderSelectedInstance?.dateSelected}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidderSelectedInstance?.bidderType}">
				<li class="fieldcontain">
					<span id="bidderType-label" class="property-label"><g:message code="bidderSelected.bidderType.label" default="Bidder Type" /></span>
					
						<span class="property-value" aria-labelledby="bidderType-label"><g:fieldValue bean="${bidderSelectedInstance}" field="bidderType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bidderSelectedInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="bidderSelected.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${bidderSelectedInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bidderSelectedInstance?.id}" />
					<g:link class="edit" action="edit" id="${bidderSelectedInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
