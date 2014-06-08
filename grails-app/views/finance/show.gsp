
<%@ page import="ProjectIntegrationManagement.MonitoringAndControllingProjectWork.Finance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'finance.label', default: 'Finance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-finance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-finance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list finance">
			
				<g:if test="${financeInstance?.ac}">
				<li class="fieldcontain">
					<span id="ac-label" class="property-label"><g:message code="finance.ac.label" default="Ac" /></span>
					
						<span class="property-value" aria-labelledby="ac-label"><g:fieldValue bean="${financeInstance}" field="ac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.ev}">
				<li class="fieldcontain">
					<span id="ev-label" class="property-label"><g:message code="finance.ev.label" default="Ev" /></span>
					
						<span class="property-value" aria-labelledby="ev-label"><g:fieldValue bean="${financeInstance}" field="ev"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.evTotal}">
				<li class="fieldcontain">
					<span id="evTotal-label" class="property-label"><g:message code="finance.evTotal.label" default="Ev Total" /></span>
					
						<span class="property-value" aria-labelledby="evTotal-label"><g:fieldValue bean="${financeInstance}" field="evTotal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.income}">
				<li class="fieldcontain">
					<span id="income-label" class="property-label"><g:message code="finance.income.label" default="Income" /></span>
					
						<span class="property-value" aria-labelledby="income-label"><g:fieldValue bean="${financeInstance}" field="income"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.netIncome}">
				<li class="fieldcontain">
					<span id="netIncome-label" class="property-label"><g:message code="finance.netIncome.label" default="Net Income" /></span>
					
						<span class="property-value" aria-labelledby="netIncome-label"><g:fieldValue bean="${financeInstance}" field="netIncome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.pv}">
				<li class="fieldcontain">
					<span id="pv-label" class="property-label"><g:message code="finance.pv.label" default="Pv" /></span>
					
						<span class="property-value" aria-labelledby="pv-label"><g:fieldValue bean="${financeInstance}" field="pv"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.sales}">
				<li class="fieldcontain">
					<span id="sales-label" class="property-label"><g:message code="finance.sales.label" default="Sales" /></span>
					
						<span class="property-value" aria-labelledby="sales-label"><g:fieldValue bean="${financeInstance}" field="sales"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.shareHolderQuality}">
				<li class="fieldcontain">
					<span id="shareHolderQuality-label" class="property-label"><g:message code="finance.shareHolderQuality.label" default="Share Holder Quality" /></span>
					
						<span class="property-value" aria-labelledby="shareHolderQuality-label"><g:fieldValue bean="${financeInstance}" field="shareHolderQuality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${financeInstance?.totalAssets}">
				<li class="fieldcontain">
					<span id="totalAssets-label" class="property-label"><g:message code="finance.totalAssets.label" default="Total Assets" /></span>
					
						<span class="property-value" aria-labelledby="totalAssets-label"><g:fieldValue bean="${financeInstance}" field="totalAssets"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${financeInstance?.id}" />
					<g:link class="edit" action="edit" id="${financeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
