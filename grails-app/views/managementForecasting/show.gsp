
<%@ page import="ProjectCostManagement.ControlCost.ManagementForecasting" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'managementForecasting.label', default: 'ManagementForecasting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-managementForecasting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-managementForecasting" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list managementForecasting">
			
				<g:if test="${managementForecastingInstance?.periode}">
				<li class="fieldcontain">
					<span id="periode-label" class="property-label"><g:message code="managementForecasting.periode.label" default="Periode" /></span>
					
						<span class="property-value" aria-labelledby="periode-label"><g:fieldValue bean="${managementForecastingInstance}" field="periode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementForecastingInstance?.estimateCost}">
				<li class="fieldcontain">
					<span id="estimateCost-label" class="property-label"><g:message code="managementForecasting.estimateCost.label" default="Estimate Cost" /></span>
					
						<span class="property-value" aria-labelledby="estimateCost-label"><g:fieldValue bean="${managementForecastingInstance}" field="estimateCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementForecastingInstance?.trendValue}">
				<li class="fieldcontain">
					<span id="trendValue-label" class="property-label"><g:message code="managementForecasting.trendValue.label" default="Trend Value" /></span>
					
						<span class="property-value" aria-labelledby="trendValue-label"><g:fieldValue bean="${managementForecastingInstance}" field="trendValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${managementForecastingInstance?.budget}">
				<li class="fieldcontain">
					<span id="budget-label" class="property-label"><g:message code="managementForecasting.budget.label" default="Budget" /></span>
					
						<span class="property-value" aria-labelledby="budget-label"><g:link controller="monthBudget" action="show" id="${managementForecastingInstance?.budget?.id}">${managementForecastingInstance?.budget?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${managementForecastingInstance?.id}" />
					<g:link class="edit" action="edit" id="${managementForecastingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
