
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.CostBenefitAnalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costBenefitAnalysis.label', default: 'CostBenefitAnalysis')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-costBenefitAnalysis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-costBenefitAnalysis" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list costBenefitAnalysis">
			
				<g:if test="${costBenefitAnalysisInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="costBenefitAnalysis.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="businessCase" action="show" id="${costBenefitAnalysisInstance?.projectName?.id}">${costBenefitAnalysisInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBenefitAnalysisInstance?.actionAnalysis}">
				<li class="fieldcontain">
					<span id="actionAnalysis-label" class="property-label"><g:message code="costBenefitAnalysis.actionAnalysis.label" default="Action Analysis" /></span>
					
						<span class="property-value" aria-labelledby="actionAnalysis-label"><g:fieldValue bean="${costBenefitAnalysisInstance}" field="actionAnalysis"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBenefitAnalysisInstance?.actionType}">
				<li class="fieldcontain">
					<span id="actionType-label" class="property-label"><g:message code="costBenefitAnalysis.actionType.label" default="Action Type" /></span>
					
						<span class="property-value" aria-labelledby="actionType-label"><g:fieldValue bean="${costBenefitAnalysisInstance}" field="actionType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBenefitAnalysisInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="costBenefitAnalysis.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${costBenefitAnalysisInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBenefitAnalysisInstance?.firstYearCost}">
				<li class="fieldcontain">
					<span id="firstYearCost-label" class="property-label"><g:message code="costBenefitAnalysis.firstYearCost.label" default="First Year Cost" /></span>
					
						<span class="property-value" aria-labelledby="firstYearCost-label"><g:fieldValue bean="${costBenefitAnalysisInstance}" field="firstYearCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costBenefitAnalysisInstance?.proyekid}">
				<li class="fieldcontain">
					<span id="proyekid-label" class="property-label"><g:message code="costBenefitAnalysis.proyekid.label" default="Proyekid" /></span>
					
						<span class="property-value" aria-labelledby="proyekid-label"><g:fieldValue bean="${costBenefitAnalysisInstance}" field="proyekid"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${costBenefitAnalysisInstance?.id}" />
					<g:link class="edit" action="edit" id="${costBenefitAnalysisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
