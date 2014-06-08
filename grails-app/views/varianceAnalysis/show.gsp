
<%@ page import="ProjectScopeManagement.ControlScope.VarianceAnalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'varianceAnalysis.label', default: 'VarianceAnalysis')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-varianceAnalysis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-varianceAnalysis" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list varianceAnalysis">
			
				<g:if test="${varianceAnalysisInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="varianceAnalysis.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:link controller="projectCharter" action="show" id="${varianceAnalysisInstance?.projectName?.id}">${varianceAnalysisInstance?.projectName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.dateRequested}">
				<li class="fieldcontain">
					<span id="dateRequested-label" class="property-label"><g:message code="varianceAnalysis.dateRequested.label" default="Date Requested" /></span>
					
						<span class="property-value" aria-labelledby="dateRequested-label"><g:formatDate date="${varianceAnalysisInstance?.dateRequested}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.changeRequestor}">
				<li class="fieldcontain">
					<span id="changeRequestor-label" class="property-label"><g:message code="varianceAnalysis.changeRequestor.label" default="Change Requestor" /></span>
					
						<span class="property-value" aria-labelledby="changeRequestor-label"><g:link controller="stakeholderRegister" action="show" id="${varianceAnalysisInstance?.changeRequestor?.id}">${varianceAnalysisInstance?.changeRequestor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.changeCategory}">
				<li class="fieldcontain">
					<span id="changeCategory-label" class="property-label"><g:message code="varianceAnalysis.changeCategory.label" default="Change Category" /></span>
					
						<span class="property-value" aria-labelledby="changeCategory-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="changeCategory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.changeAffect}">
				<li class="fieldcontain">
					<span id="changeAffect-label" class="property-label"><g:message code="varianceAnalysis.changeAffect.label" default="Change Affect" /></span>
					
						<span class="property-value" aria-labelledby="changeAffect-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="changeAffect"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.changeRequested}">
				<li class="fieldcontain">
					<span id="changeRequested-label" class="property-label"><g:message code="varianceAnalysis.changeRequested.label" default="Change Requested" /></span>
					
						<span class="property-value" aria-labelledby="changeRequested-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="changeRequested"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.reasonForChange}">
				<li class="fieldcontain">
					<span id="reasonForChange-label" class="property-label"><g:message code="varianceAnalysis.reasonForChange.label" default="Reason For Change" /></span>
					
						<span class="property-value" aria-labelledby="reasonForChange-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="reasonForChange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.alternativeConsidered}">
				<li class="fieldcontain">
					<span id="alternativeConsidered-label" class="property-label"><g:message code="varianceAnalysis.alternativeConsidered.label" default="Alternative Considered" /></span>
					
						<span class="property-value" aria-labelledby="alternativeConsidered-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="alternativeConsidered"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.requiredTechnicalChange}">
				<li class="fieldcontain">
					<span id="requiredTechnicalChange-label" class="property-label"><g:message code="varianceAnalysis.requiredTechnicalChange.label" default="Required Technical Change" /></span>
					
						<span class="property-value" aria-labelledby="requiredTechnicalChange-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="requiredTechnicalChange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.riskForTheChange}">
				<li class="fieldcontain">
					<span id="riskForTheChange-label" class="property-label"><g:message code="varianceAnalysis.riskForTheChange.label" default="Risk For The Change" /></span>
					
						<span class="property-value" aria-labelledby="riskForTheChange-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="riskForTheChange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.estimatedCostNeeded}">
				<li class="fieldcontain">
					<span id="estimatedCostNeeded-label" class="property-label"><g:message code="varianceAnalysis.estimatedCostNeeded.label" default="Estimated Cost Needed" /></span>
					
						<span class="property-value" aria-labelledby="estimatedCostNeeded-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="estimatedCostNeeded"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.estimatedResourceNeeded}">
				<li class="fieldcontain">
					<span id="estimatedResourceNeeded-label" class="property-label"><g:message code="varianceAnalysis.estimatedResourceNeeded.label" default="Estimated Resource Needed" /></span>
					
						<span class="property-value" aria-labelledby="estimatedResourceNeeded-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="estimatedResourceNeeded"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.implicationOfQuality}">
				<li class="fieldcontain">
					<span id="implicationOfQuality-label" class="property-label"><g:message code="varianceAnalysis.implicationOfQuality.label" default="Implication Of Quality" /></span>
					
						<span class="property-value" aria-labelledby="implicationOfQuality-label"><g:fieldValue bean="${varianceAnalysisInstance}" field="implicationOfQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${varianceAnalysisInstance?.approvals}">
				<li class="fieldcontain">
					<span id="approvals-label" class="property-label"><g:message code="varianceAnalysis.approvals.label" default="Approvals" /></span>
					
						<g:each in="${varianceAnalysisInstance.approvals}" var="a">
						<span class="property-value" aria-labelledby="approvals-label"><g:link controller="changeBoardApproval" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${varianceAnalysisInstance?.id}" />
					<g:link class="edit" action="edit" id="${varianceAnalysisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
