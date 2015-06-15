<%@ page import="ProjectRiskManagement.Planning.AnalysisTimeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-analysisTimeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/AnalysisCostManagementPlan/list"><g:message code="Analysis Cost Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/AnalysisProjectScopeStatement/list"><g:message code="Analysis Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/AnalysisQualityManagementPlan/list"><g:message code="Analysis Quality Management Plan"/></a></li>                                 
			</ul>
		</div>
		<div id="create-analysisTimeManagementPlan" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${analysisTimeManagementPlanInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${analysisTimeManagementPlanInstance}" var="error">
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
