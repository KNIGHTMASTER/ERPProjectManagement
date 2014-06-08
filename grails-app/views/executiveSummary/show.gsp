
<%@ page import="ProjectIntegrationManagement.DevelopProjectCharter.ExecutiveSummary" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'executiveSummary.label', default: 'ExecutiveSummary')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-executiveSummary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-executiveSummary" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list executiveSummary">
			
				<g:if test="${executiveSummaryInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="executiveSummary.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="businessCase" action="show" id="${executiveSummaryInstance?.projectName?.id}">${executiveSummaryInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${executiveSummaryInstance?.issue}">
				<li class="fieldcontain">
					<span id="issue-label" class="property-label"><g:message code="executiveSummary.issue.label" default="Issue" /></span>
					
                                          <span class="property-value" aria-labelledby="issue-label">${executiveSummaryInstance.issue}</span>
					
				</li>
				</g:if>
			
				<g:if test="${executiveSummaryInstance?.anticipatedOutcomes}">
				<li class="fieldcontain">
					<span id="anticipatedOutcomes-label" class="property-label"><g:message code="executiveSummary.anticipatedOutcomes.label" default="Anticipated Outcomes" /></span>
					
						<span class="property-value" aria-labelledby="anticipatedOutcomes-label">${executiveSummaryInstance.anticipatedOutcomes}</span>
					
				</li>
				</g:if>
			
				<g:if test="${executiveSummaryInstance?.recommendation}">
				<li class="fieldcontain">
					<span id="recommendation-label" class="property-label"><g:message code="executiveSummary.recommendation.label" default="Recommendation" /></span>
					
						<span class="property-value" aria-labelledby="recommendation-label">${executiveSummaryInstance.recommendation}</span>
					
				</li>
				</g:if>
			
				<g:if test="${executiveSummaryInstance?.justification}">
				<li class="fieldcontain">
					<span id="justification-label" class="property-label"><g:message code="executiveSummary.justification.label" default="Justification" /></span>
					
						<span class="property-value" aria-labelledby="justification-label">${executiveSummaryInstance.justification}</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${executiveSummaryInstance?.id}" />
					<g:link class="edit" action="edit" id="${executiveSummaryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
