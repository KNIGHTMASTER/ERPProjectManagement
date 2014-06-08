
<%@ page import="ProjectRiskManagement.Planning.AnalysisTimeManagementPlan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analysisTimeManagementPlan.label', default: 'AnalysisTimeManagementPlan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-analysisTimeManagementPlan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                <li><a href="/ERPProjectManagement/IdentificationTimeManagementPlan/list"><g:message code="Identification Time Management Plan"/></a></li>
                                <li><a href="/ERPProjectManagement/AnalysisCostManagementPlan/list"><g:message code="Analysis Cost Management Plan"/></a></li>                                 
                                 <li><a href="/ERPProjectManagement/AnalysisProjectScopeStatement/list"><g:message code="Analysis Project Scope Statement"/></a></li>
                                 <li><a href="/ERPProjectManagement/AnalysisQualityManagementPlan/list"><g:message code="Analysis Quality Management Plan"/></a></li>                                 
			</ul>
		</div>
		<div id="show-analysisTimeManagementPlan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list analysisTimeManagementPlan">
			
				<g:if test="${analysisTimeManagementPlanInstance?.identificationTimeManagementPlan}">
				<li class="fieldcontain">
					<span id="identificationTimeManagementPlan-label" class="property-label"><g:message code="analysisTimeManagementPlan.identificationTimeManagementPlan.label" default="Identification Time Management Plan" /></span>
					
						<span class="property-value" aria-labelledby="identificationTimeManagementPlan-label"><g:link controller="identificationTimeManagementPlan" action="show" id="${analysisTimeManagementPlanInstance?.identificationTimeManagementPlan?.id}">${analysisTimeManagementPlanInstance?.identificationTimeManagementPlan?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisTimeManagementPlanInstance?.ranking}">
				<li class="fieldcontain">
					<span id="ranking-label" class="property-label"><g:message code="analysisTimeManagementPlan.ranking.label" default="Ranking" /></span>
					
						<span class="property-value" aria-labelledby="ranking-label"><g:fieldValue bean="${analysisTimeManagementPlanInstance}" field="ranking"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisTimeManagementPlanInstance?.subCategories}">
				<li class="fieldcontain">
					<span id="subCategories-label" class="property-label"><g:message code="analysisTimeManagementPlan.subCategories.label" default="Sub Categories" /></span>
					
						<span class="property-value" aria-labelledby="subCategories-label"><g:link controller="subCategories" action="show" id="${analysisTimeManagementPlanInstance?.subCategories?.id}">${analysisTimeManagementPlanInstance?.subCategories?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisTimeManagementPlanInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="analysisTimeManagementPlan.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${analysisTimeManagementPlanInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analysisTimeManagementPlanInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="analysisTimeManagementPlan.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${analysisTimeManagementPlanInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${analysisTimeManagementPlanInstance?.id}" />
					<g:link class="edit" action="edit" id="${analysisTimeManagementPlanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
