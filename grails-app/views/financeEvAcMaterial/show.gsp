
<%@ page import="ProjectCostManagement.DetermineBudget.FinanceEvAcMaterial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'financeEvAcMaterial.label', default: 'FinanceEvAcMaterial')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-financeEvAcMaterial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-financeEvAcMaterial" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list financeEvAcMaterial">
			
				<g:if test="${financeEvAcMaterialInstance?.ac}">
				<li class="fieldcontain">
					<span id="ac-label" class="property-label"><g:message code="financeEvAcMaterial.ac.label" default="Ac" /></span>
					
						<span class="property-value" aria-labelledby="ac-label"><g:fieldValue bean="${financeEvAcMaterialInstance}" field="ac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeEvAcMaterialInstance?.evr}">
				<li class="fieldcontain">
					<span id="evr-label" class="property-label"><g:message code="financeEvAcMaterial.evr.label" default="Evr" /></span>
					
						<span class="property-value" aria-labelledby="evr-label"><g:fieldValue bean="${financeEvAcMaterialInstance}" field="evr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeEvAcMaterialInstance?.materialCostActivity}">
				<li class="fieldcontain">
					<span id="materialCostActivity-label" class="property-label"><g:message code="financeEvAcMaterial.materialCostActivity.label" default="Material Cost Activity" /></span>
					
						<span class="property-value" aria-labelledby="materialCostActivity-label"><g:link controller="materialCostActivity" action="show" id="${financeEvAcMaterialInstance?.materialCostActivity?.id}">${financeEvAcMaterialInstance?.materialCostActivity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${financeEvAcMaterialInstance?.id}" />
					<g:link class="edit" action="edit" id="${financeEvAcMaterialInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
