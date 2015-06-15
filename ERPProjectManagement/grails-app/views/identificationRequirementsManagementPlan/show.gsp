
<%@ page import="ProjectRiskManagement.Planning.IdentificationRequirementsManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationRequirementsManagementPlan.label', default: 'IdentificationRequirementsManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-identificationRequirementsManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/requirementsManagementPlan/list"><g:message code="Requirements Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationDelay"><g:message code="Identification Delay"/></a></li>
                                <li><a href="/ERPProjectManagement/identificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>                                                                                                   
			</ul>
		</div>
		<div id="show-identificationRequirementsManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list identificationRequirementsManagementPlan">
			
				<g:if test="${identificationRequirementsManagementPlanInstance?.requirementsDocumentation}">
				<li class="fieldcontain">
					<span id="requirementsDocumentation-label" class="property-label"><g:message code="identificationRequirementsManagementPlan.requirementsDocumentation.label" default="Requirements Documentation" /></span>
					
						<span class="property-value" aria-labelledby="requirementsDocumentation-label"><g:link controller="requirementsDocumentation" action="show" id="${identificationRequirementsManagementPlanInstance?.requirementsDocumentation?.id}">${identificationRequirementsManagementPlanInstance?.requirementsDocumentation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationRequirementsManagementPlanInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="identificationRequirementsManagementPlan.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${identificationRequirementsManagementPlanInstance?.riskCategories?.id}">${identificationRequirementsManagementPlanInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationRequirementsManagementPlanInstance?.risk}">
				<li class="fieldcontain">
					<span id="risk-label" class="property-label"><g:message code="identificationRequirementsManagementPlan.risk.label" default="Risk" /></span>
					
						<span class="property-value" aria-labelledby="risk-label"><g:fieldValue bean="${identificationRequirementsManagementPlanInstance}" field="risk"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationRequirementsManagementPlanInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="identificationRequirementsManagementPlan.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${identificationRequirementsManagementPlanInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${identificationRequirementsManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${identificationRequirementsManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
