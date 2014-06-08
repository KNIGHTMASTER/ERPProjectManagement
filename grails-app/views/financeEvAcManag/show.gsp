
<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAcManag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'financeEvAcManag.label', default: 'FinanceEvAcManag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-financeEvAcManag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-financeEvAcManag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list financeEvAcManag">
			
				<g:if test="${financeEvAcManagInstance?.ac}">
				<li class="fieldcontain">
					<span id="ac-label" class="property-label"><g:message code="financeEvAcManag.ac.label" default="Ac" /></span>
					
						<span class="property-value" aria-labelledby="ac-label"><g:fieldValue bean="${financeEvAcManagInstance}" field="ac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeEvAcManagInstance?.evr}">
				<li class="fieldcontain">
					<span id="evr-label" class="property-label"><g:message code="financeEvAcManag.evr.label" default="Evr" /></span>
					
						<span class="property-value" aria-labelledby="evr-label"><g:fieldValue bean="${financeEvAcManagInstance}" field="evr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeEvAcManagInstance?.managementCostActivity}">
				<li class="fieldcontain">
					<span id="managementCostActivity-label" class="property-label"><g:message code="financeEvAcManag.managementCostActivity.label" default="Management Cost Activity" /></span>
					
						<span class="property-value" aria-labelledby="managementCostActivity-label"><g:link controller="managementCostActivity" action="show" id="${financeEvAcManagInstance?.managementCostActivity?.id}">${financeEvAcManagInstance?.managementCostActivity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${financeEvAcManagInstance?.id}" />
					<g:link class="edit" action="edit" id="${financeEvAcManagInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
