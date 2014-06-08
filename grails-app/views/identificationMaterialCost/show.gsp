
<%@ page import="ProjectRiskManagement.Planning.IdentificationMaterialCost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationMaterialCost.label', default: 'IdentificationMaterialCost')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-identificationMaterialCost" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/MaterialCostActivity/list"><g:message code="Material Cost Activity"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationCostManagementPlan/list"><g:message code="Identification Cost Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationDelay/list"><g:message code="Identification Delay Activity"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
			</ul>
		</div>
		<div id="show-identificationMaterialCost" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list identificationMaterialCost">
			
				<g:if test="${identificationMaterialCostInstance?.materialCostActivity}">
				<li class="fieldcontain">
					<span id="materialCostActivity-label" class="property-label"><g:message code="identificationMaterialCost.materialCostActivity.label" default="Material Cost Activity" /></span>
					
						<span class="property-value" aria-labelledby="materialCostActivity-label"><g:link controller="materialCostActivity" action="show" id="${identificationMaterialCostInstance?.materialCostActivity?.id}">${identificationMaterialCostInstance?.materialCostActivity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationMaterialCostInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="identificationMaterialCost.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${identificationMaterialCostInstance?.riskCategories?.id}">${identificationMaterialCostInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationMaterialCostInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="identificationMaterialCost.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${identificationMaterialCostInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${identificationMaterialCostInstance?.id}" />
					<g:link class="edit" action="edit" id="${identificationMaterialCostInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
