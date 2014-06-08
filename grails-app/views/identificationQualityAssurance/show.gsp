
<%@ page import="ProjectRiskManagement.Planning.IdentificationQualityAssurance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationQualityAssurance.label', default: 'IdentificationQualityAssurance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-identificationQualityAssurance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-identificationQualityAssurance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list identificationQualityAssurance">
			
				<g:if test="${identificationQualityAssuranceInstance?.qualityAssurance}">
				<li class="fieldcontain">
					<span id="qualityAssurance-label" class="property-label"><g:message code="identificationQualityAssurance.qualityAssurance.label" default="Quality Assurance" /></span>
					
						<span class="property-value" aria-labelledby="qualityAssurance-label"><g:link controller="qualityAssurance" action="show" id="${identificationQualityAssuranceInstance?.qualityAssurance?.id}">${identificationQualityAssuranceInstance?.qualityAssurance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationQualityAssuranceInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="identificationQualityAssurance.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${identificationQualityAssuranceInstance?.riskCategories?.id}">${identificationQualityAssuranceInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationQualityAssuranceInstance?.risk}">
				<li class="fieldcontain">
					<span id="risk-label" class="property-label"><g:message code="identificationQualityAssurance.risk.label" default="Risk" /></span>
					
						<span class="property-value" aria-labelledby="risk-label"><g:fieldValue bean="${identificationQualityAssuranceInstance}" field="risk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationQualityAssuranceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="identificationQualityAssurance.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${identificationQualityAssuranceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${identificationQualityAssuranceInstance?.id}" />
					<g:link class="edit" action="edit" id="${identificationQualityAssuranceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
