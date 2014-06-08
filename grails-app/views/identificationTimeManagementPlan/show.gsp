
<%@ page import="ProjectRiskManagement.Planning.IdentificationTimeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'identificationTimeManagementPlan.label', default: 'IdentificationTimeManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-identificationTimeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
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
		<div id="show-identificationTimeManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list identificationTimeManagementPlan">
			
				<g:if test="${identificationTimeManagementPlanInstance?.activity}">
				<li class="fieldcontain">
					<span id="activity-label" class="property-label"><g:message code="identificationTimeManagementPlan.activity.label" default="Activity" /></span>
					
						<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${identificationTimeManagementPlanInstance?.activity?.id}">${identificationTimeManagementPlanInstance?.activity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationTimeManagementPlanInstance?.riskCategories}">
				<li class="fieldcontain">
					<span id="riskCategories-label" class="property-label"><g:message code="identificationTimeManagementPlan.riskCategories.label" default="Risk Categories" /></span>
					
						<span class="property-value" aria-labelledby="riskCategories-label"><g:link controller="riskCategories" action="show" id="${identificationTimeManagementPlanInstance?.riskCategories?.id}">${identificationTimeManagementPlanInstance?.riskCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${identificationTimeManagementPlanInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="identificationTimeManagementPlan.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${identificationTimeManagementPlanInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${identificationTimeManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${identificationTimeManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
