
<%@ page import="ProjectRiskManagement.Planning.AnalysisCostManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisCostManagementPlan.label', default: 'AnalysisCostManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-analysisCostManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/costManagementPlan/list"><g:message code="Cost Management Plan List"/></a></li>
                                <li><a href="/ERPProjectManagement/AnalysisTimeManagementPlan/list"><g:message code="Analysis Time Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/AnalysisProjectScopeStatement/list"><g:message code="Analysis Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/AnalysisQualityManagementPlan/list"><g:message code="Analysis Quality Management Plan"/></a></li>                                 
			</ul>
		</div>
		<div id="show-analysisCostManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list analysisCostManagementPlan">
			
				<g:if test="${analysisCostManagementPlanInstance?.identificationCostManagementPlan}">
				<li class="fieldcontain">
					<span id="identificationCostManagementPlan-label" class="property-label"><g:message code="analysisCostManagementPlan.identificationCostManagementPlan.label" default="Identification Cost Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="identificationCostManagementPlan-label"><g:link controller="identificationCostManagementPlan" action="show" id="${analysisCostManagementPlanInstance?.identificationCostManagementPlan?.id}">${analysisCostManagementPlanInstance?.identificationCostManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisCostManagementPlanInstance?.ranking}">
				<li class="fieldcontain">
					<span id="ranking-label" class="property-label"><g:message code="analysisCostManagementPlan.ranking.label" default="Ranking" /></span>
					
						<span class="property-value" aria-labelledby="ranking-label"><g:fieldValue bean="${analysisCostManagementPlanInstance}" field="ranking"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisCostManagementPlanInstance?.subCategories}">
				<li class="fieldcontain">
					<span id="subCategories-label" class="property-label"><g:message code="analysisCostManagementPlan.subCategories.label" default="Sub Categories" /></span>
					
						<span class="property-value" aria-labelledby="subCategories-label"><g:link controller="subCategories" action="show" id="${analysisCostManagementPlanInstance?.subCategories?.id}">${analysisCostManagementPlanInstance?.subCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisCostManagementPlanInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="analysisCostManagementPlan.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${analysisCostManagementPlanInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisCostManagementPlanInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="analysisCostManagementPlan.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${analysisCostManagementPlanInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${analysisCostManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${analysisCostManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
