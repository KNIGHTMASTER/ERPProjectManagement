<%@ page import="ProjectRiskManagement.Planning.IdentificationTimeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-identificationTimeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/activity/list"><g:message code="Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/delayActivity/list"><g:message code="Identification Delay"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/identificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
			</ul>
		</div>
		<div id="create-identificationTimeManagementPlan" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${identificationTimeManagementPlanInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${identificationTimeManagementPlanInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
