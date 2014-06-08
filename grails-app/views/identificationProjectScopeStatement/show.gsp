
<%@ page import="ProjectRiskManagement.Planning.IdentificationProjectScopeStatement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationProjectScopeStatement.label', default: 'IdentificationProjectScopeStatement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-identificationProjectScopeStatement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/projectScopeStatement/list"><g:message code="Project Scope Statement"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationDelay"><g:message code="Identification Delay"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>                                                                                                   
                                 
			</ul>
		</div>
		<div id="show-identificationProjectScopeStatement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list identificationProjectScopeStatement">
			
				<g:if test="${identificationProjectScopeStatementInstance?.projectScopeStatement}">
				<li class="fieldcontain">
					<span id="projectScopeStatement-label" class="property-label"><g:message code="identificationProjectScopeStatement.projectScopeStatement.label" default="Project Scope Statement" /></span>
					
						<span class="property-value" aria-labelledby="projectScopeStatement-label"><g:link controller="projectScopeStatement" action="show" id="${identificationProjectScopeStatementInstance?.projectScopeStatement?.id}">${identificationProjectScopeStatementInstance?.projectScopeStatement?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationProjectScopeStatementInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="identificationProjectScopeStatement.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${identificationProjectScopeStatementInstance?.riskCategories?.id}">${identificationProjectScopeStatementInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationProjectScopeStatementInstance?.risk}">
				<li class="fieldcontain">
					<span id="risk-label" class="property-label"><g:message code="identificationProjectScopeStatement.risk.label" default="Risk" /></span>
					
						<span class="property-value" aria-labelledby="risk-label"><g:fieldValue bean="${identificationProjectScopeStatementInstance}" field="risk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationProjectScopeStatementInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="identificationProjectScopeStatement.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${identificationProjectScopeStatementInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${identificationProjectScopeStatementInstance?.id}" />
					<g:link class="edit" action="edit" id="${identificationProjectScopeStatementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
