
<%@ page import="ProjectCostManagement.EstimateCost.BasicOfEstimate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'basicOfEstimate.label', default: 'BasicOfEstimate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-basicOfEstimate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="/ERPProjectManagement/PCost"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-basicOfEstimate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list basicOfEstimate">
			
				<g:if test="${basicOfEstimateInstance?.idMilestone}">
				<li class="fieldcontain">
					<span id="idMilestone-label" class="property-label"><g:message code="basicOfEstimate.idMilestone.label" default="Id Milestone" /></span>
					
						<span class="property-value" aria-labelledby="idMilestone-label"><g:link controller="milestones" action="show" id="${basicOfEstimateInstance?.idMilestone?.id}">${basicOfEstimateInstance?.idMilestone?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicOfEstimateInstance?.pessimistic}">
				<li class="fieldcontain">
					<span id="pessimistic-label" class="property-label"><g:message code="basicOfEstimate.pessimistic.label" default="Pessimistic" /></span>
					
						<span class="property-value" aria-labelledby="pessimistic-label"><g:fieldValue bean="${basicOfEstimateInstance}" field="pessimistic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicOfEstimateInstance?.optimistic}">
				<li class="fieldcontain">
					<span id="optimistic-label" class="property-label"><g:message code="basicOfEstimate.optimistic.label" default="Optimistic" /></span>
					
						<span class="property-value" aria-labelledby="optimistic-label"><g:fieldValue bean="${basicOfEstimateInstance}" field="optimistic"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicOfEstimateInstance?.mostLikelyEstimate}">
				<li class="fieldcontain">
					<span id="mostLikelyEstimate-label" class="property-label"><g:message code="basicOfEstimate.mostLikelyEstimate.label" default="Most Likely Estimate" /></span>
					
						<span class="property-value" aria-labelledby="mostLikelyEstimate-label"><g:fieldValue bean="${basicOfEstimateInstance}" field="mostLikelyEstimate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${basicOfEstimateInstance?.costMethodology}">
				<li class="fieldcontain">
					<span id="costMethodology-label" class="property-label"><g:message code="basicOfEstimate.costMethodology.label" default="Cost Methodology" /></span>
					
						<span class="property-value" aria-labelledby="costMethodology-label"><g:fieldValue bean="${basicOfEstimateInstance}" field="costMethodology"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${basicOfEstimateInstance?.id}" />
					<g:link class="edit" action="edit" id="${basicOfEstimateInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
