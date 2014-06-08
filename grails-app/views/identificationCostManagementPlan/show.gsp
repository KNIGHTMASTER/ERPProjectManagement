
<%@ page import="ProjectRiskManagement.Planning.IdentificationCostManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationCostManagementPlan.label', default: 'IdentificationCostManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-identificationCostManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/costManagementPlan/list"><g:message code="Cost Management Plan List"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationMaterialCost/list"><g:message code="Identification Material Cost"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationDelay/list"><g:message code="Identification Delay Activity"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationProjectScopeStatement/list"><g:message code="Identification Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationRequirementsManagementPlan/list"><g:message code="Identification Requirements Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityManagementPlan/list"><g:message code="Identification Quality Management Plan"/></a></li>
                                 <li><a href="/ERPProjectManagement/IdentificationQualityAssurance/list"><g:message code="Identification Quality Assurance"/></a></li>
			</ul>
		</div>
		<div id="show-identificationCostManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list identificationCostManagementPlan">
			
				<g:if test="${identificationCostManagementPlanInstance?.costManagementPlan}">
				<li class="fieldcontain">
					<span id="costManagementPlan-label" class="property-label"><g:message code="identificationCostManagementPlan.costManagementPlan.label" default="Cost Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="costManagementPlan-label"><g:link controller="costManagementPlan" action="show" id="${identificationCostManagementPlanInstance?.costManagementPlan?.id}">${identificationCostManagementPlanInstance?.costManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationCostManagementPlanInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="identificationCostManagementPlan.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${identificationCostManagementPlanInstance?.riskCategories?.id}">${identificationCostManagementPlanInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationCostManagementPlanInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="identificationCostManagementPlan.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${identificationCostManagementPlanInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${identificationCostManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${identificationCostManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
