
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.FeasibilityStudy" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'feasibilityStudy.label', default: 'FeasibilityStudy')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-feasibilityStudy" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-feasibilityStudy" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list feasibilityStudy">
			
				<g:if test="${feasibilityStudyInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="feasibilityStudy.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectProposal" action="show" id="${feasibilityStudyInstance?.projectName?.id}">${feasibilityStudyInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.executiveSummary}">
				<li class="fieldcontain">
					<span id="executiveSummary-label" class="property-label"><g:message code="feasibilityStudy.executiveSummary.label" default="Executive Summary" /></span>
					
						<span class="property-value" aria-labelledby="executiveSummary-label">${feasibilityStudyInstance.executiveSummary}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.descriptionOfProducts}">
				<li class="fieldcontain">
					<span id="descriptionOfProducts-label" class="property-label"><g:message code="feasibilityStudy.descriptionOfProducts.label" default="Description Of Products" /></span>
					
						<span class="property-value" aria-labelledby="descriptionOfProducts-label">${feasibilityStudyInstance.descriptionOfProducts}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.technologyConsiderations}">
				<li class="fieldcontain">
					<span id="technologyConsiderations-label" class="property-label"><g:message code="feasibilityStudy.technologyConsiderations.label" default="Technology Considerations" /></span>
					
						<span class="property-value" aria-labelledby="technologyConsiderations-label">${feasibilityStudyInstance.technologyConsiderations}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.productMarketPlace}">
				<li class="fieldcontain">
					<span id="productMarketPlace-label" class="property-label"><g:message code="feasibilityStudy.productMarketPlace.label" default="Product Market Place" /></span>
					
						<span class="property-value" aria-labelledby="productMarketPlace-label">${feasibilityStudyInstance.productMarketPlace}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.marketingStrategy}">
				<li class="fieldcontain">
					<span id="marketingStrategy-label" class="property-label"><g:message code="feasibilityStudy.marketingStrategy.label" default="Marketing Strategy" /></span>
					
						<span class="property-value" aria-labelledby="marketingStrategy-label">${feasibilityStudyInstance.marketingStrategy}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.organizationAndStaffing}">
				<li class="fieldcontain">
					<span id="organizationAndStaffing-label" class="property-label"><g:message code="feasibilityStudy.organizationAndStaffing.label" default="Organization And Staffing" /></span>
					
						<span class="property-value" aria-labelledby="organizationAndStaffing-label">${feasibilityStudyInstance.organizationAndStaffing}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.schedule}">
				<li class="fieldcontain">
					<span id="schedule-label" class="property-label"><g:message code="feasibilityStudy.schedule.label" default="Schedule" /></span>
					
						<span class="property-value" aria-labelledby="schedule-label">${feasibilityStudyInstance.schedule}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.financialProjections}">
				<li class="fieldcontain">
					<span id="financialProjections-label" class="property-label"><g:message code="feasibilityStudy.financialProjections.label" default="Financial Projections" /></span>
					
						<span class="property-value" aria-labelledby="financialProjections-label">${feasibilityStudyInstance.financialProjections}</span>
					
				</li>
				</g:if>
			
				<g:if test="${feasibilityStudyInstance?.recommendations}">
				<li class="fieldcontain">
					<span id="recommendations-label" class="property-label"><g:message code="feasibilityStudy.recommendations.label" default="Recommendations" /></span>
					
						<span class="property-value" aria-labelledby="recommendations-label">${feasibilityStudyInstance.recommendations}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${feasibilityStudyInstance?.id}" />
					<g:link class="edit" action="edit" id="${feasibilityStudyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
